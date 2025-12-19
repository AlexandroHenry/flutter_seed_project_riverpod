import 'package:injectable/injectable.dart';
import 'package:project_crew/core/enum/env_type.dart';

/// custom env
const stg = Environment('stg');

/// env
const _kEnv = String.fromEnvironment('ENV', defaultValue: 'prod');
// const _kEnv = appFlavor ?? 'prod';

const kAppEnv = _kEnv == 'test' ? EnvType.test
    : _kEnv == 'dev' ? EnvType.dev
      : _kEnv == 'stg' ? EnvType.stg
        : EnvType.prod;
// final kAppEnv = kEnv.toEnvType();

// /// in-app purchase env
// const _kIapEnv = String.fromEnvironment('IAP_ENV', defaultValue: 'prod');
// const kIapEnv = (_kIapEnv == 'sandbox') ? IapEnvType.sandbox : IapEnvType.production;

/// flavor
const kAppFlavor = String.fromEnvironment('FLUTTER_APP_FLAVOR', defaultValue: 'prod');

/// inject env var
const kApiBaseUrl = String.fromEnvironment('API_BASE_URL', defaultValue: '');