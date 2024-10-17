import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/firebase/firebase_instance_provider.dart';
import '../../../config/utils/key/firebase_key.dart';
import '../data_model/car_manufacturer.dart';

part 'car_manufacturer_repo.g.dart';

@riverpod
class CarManufacturerRepo extends _$CarManufacturerRepo {
  @override
  CollectionReference<CarManufacturer> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseCarManufacturersKey.carManufacturersCollection)
        .withConverter<CarManufacturer>(
          fromFirestore: (snapshot, _) =>
              CarManufacturer.fromJson(snapshot.data()!),
          toFirestore: (CarManufacturer value, _) => value.toJson(),
        );
  }

  //メーカーデータを名前絞り込みで取得
  Future<CarManufacturer> getCarManufacturerDataByName({
    required String carManufacturerName,
  }) async {
    final snapshot = await state
        .where(FirebaseCarManufacturersKey.carManufacturerName,
            isEqualTo: carManufacturerName)
        .get();
    return snapshot.docs.first.data();
  }

  //Streamでメーカーリスト取得
  Stream<List<CarManufacturer>> watchCarManufactureList() {
    return state.snapshots().map(
      (snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      },
    );
  }

  // Streamでメーカーデータ監視
  Stream<CarManufacturer?> watchCarManufacturerData({
    required String carManufacturerId,
  }) {
    // carManufacturerIdが''の場合は空を返す。
    if (carManufacturerId == '') {
      return const Stream<CarManufacturer?>.empty();
    }
    return state.doc(carManufacturerId).snapshots().map(
      (snapshot) {
        return snapshot.data();
      },
    );
  }
}
