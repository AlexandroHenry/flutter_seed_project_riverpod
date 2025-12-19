import 'package:dio/dio.dart';
import 'package:project_crew/data/api/config/api_config.dart';
import 'package:project_crew/data/api/remote/api_service.dart';
import 'package:project_crew/data/model/response/response_model.dart';
import 'package:project_crew/domain/entity/remote/version/version_entity.dart';

class ApiServiceImpl extends ApiService {
  ApiServiceImpl({
    required this.dio,
    required this.apiConfig,
  });

  final Dio dio;
  final ApiConfig apiConfig;

}


