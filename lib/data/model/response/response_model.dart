import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_model.freezed.dart';
part 'response_model.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class ResponseModel<T> with _$ResponseModel<T> {
  const factory ResponseModel({
    required int code,
    @Default('') String message,
    @Default('') String error,
    T? result,
  }) = _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json,
      T Function(Object?) fromJsonT) =>
      _$ResponseModelFromJson(json, fromJsonT);
}