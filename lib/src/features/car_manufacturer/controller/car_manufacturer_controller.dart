import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data_model/car_manufacturer.dart';
import '../repo/car_manufacturer_repo.dart';

part 'car_manufacturer_controller.g.dart';

@riverpod
class CarManufacturerController extends _$CarManufacturerController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  //メーカー情報を名前絞り込みで取得
  Future<CarManufacturer> getCarManufacturerDataByName({
    required String carManufacturerName,
  }) async {
    return await ref
        .read(carManufacturerRepoProvider.notifier)
        .getCarManufacturerDataByName(carManufacturerName: carManufacturerName);
  }
}

// Streamでメーカーデータ監視
@riverpod
Stream<CarManufacturer?> watchCarManufacturerDataController(
  WatchCarManufacturerDataControllerRef ref, {
  required String? carManufacturerId,
}) {
  if (carManufacturerId == null) {
    return Stream.value(null);
  }
  return ref
      .read(carManufacturerRepoProvider.notifier)
      .watchCarManufacturerData(carManufacturerId: carManufacturerId);
}

// Streamでメーカーデータリスト監視
@riverpod
Stream<List<CarManufacturer>> watchCarManufactureListController(
    WatchCarManufactureListControllerRef ref) {
  return ref
      .read(carManufacturerRepoProvider.notifier)
      .watchCarManufactureList();
}
