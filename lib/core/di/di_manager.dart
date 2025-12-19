import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:project_crew/constants.dart';
import 'di_manager.config.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async =>
    GetIt.instance.init(environment: kAppEnv.name);
