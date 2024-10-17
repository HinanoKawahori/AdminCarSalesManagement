import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data_model/car_model.dart';
import '../repo/car_model_repo.dart';

part 'car_model_controller.g.dart';

@riverpod
class CarModelController extends _$CarModelController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

  //名前絞り込みで車両データ取得
  Future<CarModel> getCarModelDataByName({
    required String carModelName,
    required String carManufacturerId,
  }) async {
    return await ref
        .read(
            carModelRepoProvider(carManufacturerId: carManufacturerId).notifier)
        .getCarModelDataByName(carModelName: carModelName);
  }
}

// Streamで車種データリスト監視
@riverpod
Stream<List<CarModel>> watchCarModelListController(
    WatchCarModelListControllerRef ref,
    {required String carManufacturerId}) {
  if (carManufacturerId == '') {
    return Stream.value([]);
  }
  return ref
      .read(carModelRepoProvider(carManufacturerId: carManufacturerId).notifier)
      .watchCarModelList();
}

// Streamで車種データ監視
@riverpod
Stream<CarModel?> watchCarModelDataController(
  WatchCarModelDataControllerRef ref, {
  required String? carModelId,
  required String? carManufacturerId,
}) {
  if (carModelId == null || carManufacturerId == null) {
    return Stream.value(null);
  }
  return ref
      .read(carModelRepoProvider(carManufacturerId: carManufacturerId).notifier)
      .watchCarModelData(carModelId: carModelId);
}
