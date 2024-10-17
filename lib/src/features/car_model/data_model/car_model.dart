import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.freezed.dart';
part 'car_model.g.dart';

@freezed
class CarModel with _$CarModel {
  factory CarModel({
    required String carModelId,
    required String carModelName,
  }) = _CarModel;

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);
}
