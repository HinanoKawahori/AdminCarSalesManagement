import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_manufacturer.freezed.dart';
part 'car_manufacturer.g.dart';

@freezed
class CarManufacturer with _$CarManufacturer {
  factory CarManufacturer({
    required String carManufacturerId,
    required String carManufacturerName,
  }) = _CarManufacturer;

  factory CarManufacturer.fromJson(Map<String, dynamic> json) =>
      _$CarManufacturerFromJson(json);
}
