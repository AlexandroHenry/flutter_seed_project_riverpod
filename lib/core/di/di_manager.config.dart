// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:fluttertoast/fluttertoast.dart' as _i212;
import 'package:get_it/get_it.dart' as _i174;
import 'package:in_app_purchase/in_app_purchase.dart' as _i690;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;

import '../../data/api/config/api_config.dart' as _i284;
import '../../data/api/remote/api_service.dart' as _i148;
import '../../data/api/remote/auth_api_service.dart' as _i499;
import '../../data/api/remote/impl/auth_api_service_impl.dart' as _i407;
import '../../data/api/remote/impl/auth_api_service_mock.dart' as _i622;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../domain/repository/auth_repository.dart' as _i614;
import '../../domain/usecase/auth/login/login_usecase.dart' as _i863;
import '../../domain/usecase/auth/logout/logout_usecase.dart' as _i976;
import '../../domain/usecase/auth/reset/request_reset_code_usecase.dart'
    as _i714;
import '../../domain/usecase/auth/reset/reset_password_usecase.dart' as _i479;
import '../../domain/usecase/auth/reset/update_password_with_code_usecase.dart'
    as _i609;
import '../../domain/usecase/auth/reset/verify_reset_code_usecase.dart'
    as _i233;
import '../../domain/usecase/auth/signup/request_signup_code_usecase.dart'
    as _i682;
import '../../domain/usecase/auth/signup/sign_up_usecase.dart' as _i444;
import '../../domain/usecase/auth/signup/verify_signup_code_usecase.dart'
    as _i909;
import '../shared/impl/internal_storage_impl.dart' as _i952;
import '../shared/internal_storage.dart' as _i515;
import 'module/app_module.dart' as _i106;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';
const String _stg = 'stg';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i361.Dio>(() => appModule.dio);
    gh.factory<_i558.FlutterSecureStorage>(() => appModule.storage);
    await gh.factoryAsync<_i655.PackageInfo>(
      () => appModule.packageInfo,
      preResolve: true,
    );
    gh.factory<_i690.InAppPurchase>(() => appModule.inAppPurchase);
    gh.singleton<_i212.FToast>(() => appModule.toast);
    gh.lazySingleton<_i499.AuthApiService>(
      () => _i622.AuthApiServiceMock(),
      registerFor: {_dev, _test},
    );
    gh.lazySingleton<_i515.InternalStorage>(
      () =>
          _i952.InternalStorageImpl(storage: gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i499.AuthApiService>(
      () => _i407.AuthApiServiceImpl(
        dio: gh<_i361.Dio>(),
        apiConfig: gh<_i284.ApiConfig>(),
      )..init(),
      registerFor: {_prod, _stg},
    );
    gh.lazySingleton<_i614.AuthRepository>(
      () => _i581.AuthRepositoryImpl(
        apiService: gh<_i148.ApiService>(),
        authApiService: gh<_i499.AuthApiService>(),
      ),
    );
    gh.factory<_i444.SignUpUseCase>(
      () => _i444.SignUpUseCase(
        authRepository: gh<_i614.AuthRepository>(),
        internalStorage: gh<_i515.InternalStorage>(),
      ),
    );
    gh.factory<_i976.LogoutUseCase>(
      () => _i976.LogoutUseCase(
        authRepository: gh<_i614.AuthRepository>(),
        internalStorage: gh<_i515.InternalStorage>(),
      ),
    );
    gh.factory<_i863.LoginUseCase>(
      () => _i863.LoginUseCase(
        authRepository: gh<_i614.AuthRepository>(),
        internalStorage: gh<_i515.InternalStorage>(),
      ),
    );
    gh.factory<_i682.RequestSignupCodeUseCase>(
      () => _i682.RequestSignupCodeUseCase(
        authRepository: gh<_i614.AuthRepository>(),
      ),
    );
    gh.factory<_i909.VerifySignupCodeUseCase>(
      () => _i909.VerifySignupCodeUseCase(
        authRepository: gh<_i614.AuthRepository>(),
      ),
    );
    gh.factory<_i714.RequestResetCodeUseCase>(
      () => _i714.RequestResetCodeUseCase(
        authRepository: gh<_i614.AuthRepository>(),
      ),
    );
    gh.factory<_i479.ResetPasswordUseCase>(
      () => _i479.ResetPasswordUseCase(
        authRepository: gh<_i614.AuthRepository>(),
      ),
    );
    gh.factory<_i233.VerifyResetCodeUseCase>(
      () => _i233.VerifyResetCodeUseCase(
        authRepository: gh<_i614.AuthRepository>(),
      ),
    );
    gh.factory<_i609.UpdatePasswordWithCodeUseCase>(
      () => _i609.UpdatePasswordWithCodeUseCase(
        authRepository: gh<_i614.AuthRepository>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i106.AppModule {}
