import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/enum/sales_status.dart';
import '../../../config/firebase/firebase_instance_provider.dart';
import '../../../config/utils/key/firebase_key.dart';
import '../data_model/case.dart';

part 'case_repo.g.dart';

@riverpod
class CaseRepo extends _$CaseRepo {
  @override
  CollectionReference<Case> build() {
    return ref
        .read(firebaseFireStoreInstanceProvider)
        .collection(FirebaseCasesKey.casesCollection)
        .withConverter<Case>(
          fromFirestore: (snapshot, _) => Case.fromJson(snapshot.data()!),
          toFirestore: (Case value, _) => value.toJson(),
        );
  }

//////////////////////////////基本的なCRUD///////////////////////////////////
  // ケース作成
  Future<void> createCase({
    required Case caseData,
  }) async {
    await state.doc(caseData.caseId).set(caseData);
  }

  // ケース更新
  Future<void> updateCase({
    required Case caseData,
  }) async {
    await state.doc(caseData.caseId).update(caseData.toJson());
  }

// Streamでケース情報監視
  Stream<Case?> watchCaseData({
    required String caseId,
  }) {
    if (caseId == '') {
      return const Stream<Case?>.empty();
    }
    return state.doc(caseId).snapshots().map(
      (snapshot) {
        return snapshot.data();
      },
    );
  }

  //Futureでケース情報取得
  Future<Case> getCaseData({
    required String caseId,
  }) async {
    final DocumentSnapshot<Case> snapshot = await state.doc(caseId).get();
    return snapshot.data()!;
  }

  //Streamで全ての案件監視
  Stream<List<Case>> watchAllCaseList({
    required int limit,
  }) {
    return state
        .limit(limit)
        .where(FirebaseCasesKey.assignedEmployeeId,
            isEqualTo: ref.read(firebaseAuthProvider).currentUser!.uid)
        .orderBy(FirebaseCasesKey.updatedAt, descending: true)
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      },
    );
  }

///////////////////////全従業員のステータス別データ//////////////////////////////////
  //全従業員で、ステータス別案件監視
  Stream<List<Case>> watchCaseListOfThisStatus(int caseStatus) {
    if (ref.read(firebaseAuthProvider).currentUser == null) {
      return Stream.value([]);
    }
    //firebaseで条件を絞って検索する
    return state
        .orderBy(FirebaseCasesKey.updatedAt, descending: true)
        .where(FirebaseCasesKey.caseStatus, isEqualTo: caseStatus)
        .snapshots()
        .map(
      (snapshot) {
        if (snapshot.docs.isEmpty) {
          return [];
        }
        return snapshot.docs.map((doc) => doc.data()).toList();
      },
    );
  }

  //全従業員で、稼働中のすべての案件監視
  Stream<List<Case>> watchCaseListOfActiveStatus() {
    return state
        .where(FirebaseCasesKey.caseStatus, whereIn: [
          CaseStatus.assigningPerson.value,
          CaseStatus.scheduling.value,
          CaseStatus.confirmedVisit.value,
          CaseStatus.pending.value,
        ])
        .orderBy(FirebaseCasesKey.updatedAt, descending: true)
        .snapshots()
        .map(
          (snapshot) {
            return snapshot.docs.map((doc) => doc.data()).toList();
          },
        );
  }

///////////////////////個別のステータス別データ//////////////////////////////////
  //1従業員の、ステータス別案件監視
  Stream<List<Case>> watchEmployeeCaseListByStatus({
    required String employeeId,
    required int caseStatus,
  }) {
    return state
        .where(FirebaseCasesKey.caseStatus, isEqualTo: caseStatus)
        .where(FirebaseCasesKey.assignedEmployeeId, isEqualTo: employeeId)
        .orderBy(FirebaseCasesKey.updatedAt, descending: true)
        .snapshots()
        .map(
      (snapshot) {
        return snapshot.docs.map((doc) => doc.data()).toList();
      },
    );
  }

  Future<List<Case>> getEmployeeCaseListByStatus({
    required String employeeId,
    required int caseStatus,
  }) async {
    final query = await state
        .where(FirebaseCasesKey.caseStatus, isEqualTo: caseStatus)
        .where(FirebaseCasesKey.assignedEmployeeId, isEqualTo: employeeId)
        .orderBy(FirebaseCasesKey.updatedAt, descending: true)
        .get();
    if (query.docs.isEmpty) {
      return [];
    }
    return query.docs.map((doc) => doc.data()).toList();
  }

  //1従業員の、稼働中のすべての案件監視
  Stream<List<Case>> watchEmployeeCaseListOfActiveStatus({
    required String employeeId,
  }) {
    return state
        .where(FirebaseCasesKey.caseStatus, whereIn: [
          CaseStatus.scheduling.value,
          CaseStatus.confirmedVisit.value,
          CaseStatus.pending.value,
        ])
        .where(FirebaseCasesKey.assignedEmployeeId, isEqualTo: employeeId)
        .orderBy(FirebaseCasesKey.updatedAt, descending: true)
        .snapshots()
        .map(
          (snapshot) {
            return snapshot.docs.map((doc) => doc.data()).toList();
          },
        );
  }

  Future<List<Case>> getEmployeeCaseListOfActiveStatus({
    required String employeeId,
  }) async {
    final query = await state
        .where(FirebaseCasesKey.caseStatus, whereIn: [
          CaseStatus.scheduling.value,
          CaseStatus.confirmedVisit.value,
          CaseStatus.pending.value,
        ])
        .where(FirebaseCasesKey.assignedEmployeeId, isEqualTo: employeeId)
        .orderBy(FirebaseCasesKey.updatedAt, descending: true)
        .get();
    if (query.docs.isEmpty) {
      return [];
    }
    return query.docs.map((doc) => doc.data()).toList();
  }

////////////////////////////////////////////////////////////////////////////////////
  //1ヶ月での成約率取得
  Future<List<Case?>> getSalesResultOfTheMonth({
    required Timestamp startOfMonth,
    required Timestamp endOfMonth,
  }) async {
    final query = await state
        .where(FirebaseCasesKey.caseStatus, isEqualTo: CaseStatus.success.value)
        .where(FirebaseCasesKey.createdAt, isGreaterThanOrEqualTo: startOfMonth)
        .where(FirebaseCasesKey.createdAt, isLessThanOrEqualTo: endOfMonth)
        .where(FirebaseCasesKey.assignedEmployeeId,
            isEqualTo: ref.read(firebaseAuthProvider).currentUser!.uid)
        .get();
    if (query.docs.isEmpty) {
      return [];
    }

    return query.docs.map((doc) => doc.data()).toList();
  }

  //ひと月のステータス別の案件リスト取得
  Future<List<Case?>> getSalesResultOfTheMonthByStatus({
    required Timestamp startOfMonth,
    required Timestamp endOfMonth,
    required int caseStatus,
  }) async {
    final query = await state
        .where(FirebaseCasesKey.createdAt, isGreaterThanOrEqualTo: startOfMonth)
        .where(FirebaseCasesKey.createdAt, isLessThanOrEqualTo: endOfMonth)
        .where(
          FirebaseCasesKey.assignedEmployeeId,
          isEqualTo: ref.read(firebaseAuthProvider).currentUser!.uid,
        )
        .where(FirebaseCasesKey.caseStatus, isEqualTo: caseStatus)
        .get();
    if (query.docs.isEmpty) {
      return [];
    }

    return query.docs.map((doc) => doc.data()).toList();
  }
}
