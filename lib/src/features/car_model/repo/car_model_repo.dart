import 'package:admin_car_sales_management/src/features/car_model/data_model/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/firebase/firebase_instance_provider.dart';
import '../../../config/utils/key/firebase_key.dart';

part 'car_model_repo.g.dart';

@riverpod
class CarModelRepo extends _$CarModelRepo {
  @override
  CollectionReference<CarModel> build({
    required String carManufacturerId,
  }) {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseCarManufacturersKey.carManufacturersCollection)
        .doc(carManufacturerId)
        .collection(FirebaseCarModelsKey.carModelsCollection)
        .withConverter<CarModel>(
          fromFirestore: (snapshot, _) => CarModel.fromJson(snapshot.data()!),
          toFirestore: (CarModel value, _) => value.toJson(),
        );
  }

  //名前絞り込みで車種データ取得
  Future<CarModel> getCarModelDataByName({
    required String carModelName,
  }) async {
    final snapshot = await state
        .where(FirebaseCarModelsKey.carModelName, isEqualTo: carModelName)
        .get();
    return snapshot.docs.first.data();
  }

  //Streamで車両データリスト監視
  Stream<List<CarModel>> watchCarModelList() {
    return state.snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      },
    );
  }

  // Streamで車両データ監視
  Stream<CarModel?> watchCarModelData({
    required String carModelId,
  }) {
    // carManufacturerIdが''の場合は空を返す。
    if (carManufacturerId == '') {
      return const Stream<CarModel>.empty();
    }
    return state.doc(carModelId).snapshots().map(
      (snapshot) {
        return snapshot.data();
      },
    );
  }
}
