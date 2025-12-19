import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:project_crew/core/di/di_manager.dart';
import 'package:project_crew/core/util/screen_util.dart';
import 'package:project_crew/core/shared/csv_single_file_asset_loader.dart';
import 'package:project_crew/presentation/router/app_go_router.dart';
import 'package:project_crew/data/api/config/api_config.dart';
import 'package:project_crew/data/api/config/impl/api_config_impl.dart';
import 'package:project_crew/data/api/remote/api_service.dart';
import 'package:project_crew/data/api/remote/impl/api_service_impl.dart';
import 'package:project_crew/data/api/remote/auth_api_service.dart';
import 'package:project_crew/data/api/remote/impl/auth_api_service_mock.dart';
import 'package:project_crew/domain/repository/auth_repository.dart';
import 'package:project_crew/data/repository/firebase_auth_repository_impl.dart';
import 'package:project_crew/domain/usecase/auth/reset/request_reset_code_usecase.dart';
import 'package:project_crew/domain/usecase/auth/reset/verify_reset_code_usecase.dart';
import 'package:project_crew/domain/usecase/auth/reset/update_password_with_code_usecase.dart';
import 'package:project_crew/domain/usecase/auth/signup/request_signup_code_usecase.dart';
import 'package:project_crew/domain/usecase/auth/signup/verify_signup_code_usecase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Initialize Firebase (ensure google-services.json / GoogleService-Info.plist added)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await ScreenUtil.portraitModeOnly();
  await configureDependencies();

  // Manually register missing DI pieces not covered by generated config
  if (GetIt.instance.isRegistered<ApiConfig>() == false) {
    GetIt.instance.registerLazySingleton<ApiConfig>(() => ApiConfigImpl());
  }
  if (GetIt.instance.isRegistered<ApiService>() == false) {
    final dio = GetIt.instance<Dio>();
    GetIt.instance.registerLazySingleton<ApiService>(
      () => ApiServiceImpl(dio: dio, apiConfig: GetIt.instance<ApiConfig>()),
    );
  }

  // Toggle mock auth API usage via dart-define. Default: false (use real API).
  // Example: flutter run --dart-define=USE_MOCK_AUTH=true
  const bool kUseMockAuth =
      bool.fromEnvironment('USE_MOCK_AUTH', defaultValue: false);
  if (kUseMockAuth) {
    if (GetIt.instance.isRegistered<AuthApiService>()) {
      await GetIt.instance.unregister<AuthApiService>();
    }
    GetIt.instance.registerLazySingleton<AuthApiService>(() => AuthApiServiceMock());
  }

  // Toggle Firebase Auth-backed repository
  // Example: flutter run --dart-define=USE_FIREBASE_AUTH=true
  const bool kUseFirebaseAuth =
      bool.fromEnvironment('USE_FIREBASE_AUTH', defaultValue: true);
  if (kUseFirebaseAuth) {
    if (GetIt.instance.isRegistered<AuthRepository>()) {
      await GetIt.instance.unregister<AuthRepository>();
    }
    GetIt.instance.registerLazySingleton<AuthRepository>(
      () => FirebaseAuthRepositoryImpl(),
    );
  }

  // Manually register reset-code use cases if not already registered by DI
  if (GetIt.instance.isRegistered<RequestResetCodeUseCase>() == false) {
    GetIt.instance.registerLazySingleton<RequestResetCodeUseCase>(
      () => RequestResetCodeUseCase(authRepository: GetIt.instance<AuthRepository>()),
    );
  }
  if (GetIt.instance.isRegistered<VerifyResetCodeUseCase>() == false) {
    GetIt.instance.registerLazySingleton<VerifyResetCodeUseCase>(
      () => VerifyResetCodeUseCase(authRepository: GetIt.instance<AuthRepository>()),
    );
  }
  if (GetIt.instance.isRegistered<UpdatePasswordWithCodeUseCase>() == false) {
    GetIt.instance.registerLazySingleton<UpdatePasswordWithCodeUseCase>(
      () => UpdatePasswordWithCodeUseCase(authRepository: GetIt.instance<AuthRepository>()),
    );
  }

  // Manually register signup-code use cases if not already registered by DI
  if (GetIt.instance.isRegistered<RequestSignupCodeUseCase>() == false) {
    GetIt.instance.registerLazySingleton<RequestSignupCodeUseCase>(
      () => RequestSignupCodeUseCase(authRepository: GetIt.instance<AuthRepository>()),
    );
  }
  if (GetIt.instance.isRegistered<VerifySignupCodeUseCase>() == false) {
    GetIt.instance.registerLazySingleton<VerifySignupCodeUseCase>(
      () => VerifySignupCodeUseCase(authRepository: GetIt.instance<AuthRepository>()),
    );
  }

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ko'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CsvSingleFileAssetLoader(fileName: 'languages.csv'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      routerConfig: router,
      builder: (context, child) {
        return MediaQuery.withNoTextScaling(child: child ?? const SizedBox());
      },
    );
  }
}
