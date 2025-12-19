import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@module
abstract class AppModule {

  Dio get dio => Dio()
    ..options.connectTimeout = const Duration(milliseconds: 10000)
    ..options.receiveTimeout = const Duration(milliseconds: 10000)
    ..options.validateStatus = (status) {
      return status != null && status >= 200 && status < 300 || status == 304;
    };

  FlutterSecureStorage get storage => const FlutterSecureStorage();

  @Singleton()
  FToast get toast => FToast();

  @preResolve
  Future<PackageInfo> get packageInfo async => await PackageInfo.fromPlatform();


  InAppPurchase get inAppPurchase => InAppPurchase.instance;
}