import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/firebase/firebase_instance_provider.dart';
import '../../../config/utils/key/firebase_key.dart';
import '../data_model/employee.dart';

part 'employee_repo.g.dart';

@riverpod
class EmployeeRepo extends _$EmployeeRepo {
  @override
  CollectionReference<Employee> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseEmployeesKey.employeesCollection)
        .withConverter<Employee>(
          fromFirestore: (snapshot, _) => Employee.fromJson(snapshot.data()!),
          toFirestore: (Employee value, _) => value.toJson(),
        );
  }

  //employee追加
  Future<void> addEmployee({
    required Employee employee,
  }) async {
    await state.add(employee);
  }

  //employee更新
  Future<void> updateEmployee({
    required Employee employee,
  }) async {
    await state
        .doc(employee.employeeName)
        .update(employee.toJson()); // Assuming employeeName is unique
  }

  //employeeを1件監視
  Stream<Employee?> watchEmployeeData({
    required String employeeId,
  }) {
    if (employeeId == '') {
      return const Stream<Employee?>.empty();
    }
    return state.doc(employeeId).snapshots().map(
      (snapshot) {
        return snapshot.data();
      },
    );
  }

  //employeeを1件取得
  Future<Employee> getEmployeeData({
    required String employeeId,
  }) async {
    final DocumentSnapshot<Employee> snapshot =
        await state.doc(employeeId).get();
    return snapshot.data()!;
  }

  ////////////////////////////////////////////////////
  //Futureで全てのemployeeを取得
  Future<List<Employee>> getAllEmployeeList() async {
    final snapshot = await state.get();
    return snapshot.docs.map(
      (QueryDocumentSnapshot<Employee> doc) {
        return doc.data();
      },
    ).toList();
  }

  //Streamで全てのemployeeを取得
  Stream<List<Employee>> watchAllEmployee() {
    return state.snapshots().map(
      (snapshot) {
        if (snapshot.docs.isEmpty) {
          return [];
        }
        return snapshot.docs.map((doc) => doc.data()).toList();
      },
    );
  }
}
