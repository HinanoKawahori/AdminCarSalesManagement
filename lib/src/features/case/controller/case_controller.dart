import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../car_manufacturer/data_model/car_manufacturer.dart';
import '../../car_manufacturer/repo/car_manufacturer_repo.dart';
import '../../car_model/data_model/car_model.dart';
import '../../car_model/repo/car_model_repo.dart';
import '../data_model/case.dart';
import '../repo/case_repo.dart';

part 'case_controller.g.dart';

@riverpod
class CaseController extends _$CaseController {
  @override
  AsyncValue build() {
    return const AsyncData(null);
  }

//////////////////////////////基本的なCRUD///////////////////////////////////
  // ケース作成
  Future<void> createCase({
    required String caseName,
    required String assignedEmployeeId,
    required String customerName,
    required String? customerPhoneNumber,
    required String? customerEmail,
    required int customerGender,
    required String? customerAddress,
    required Timestamp? customerBirthDate,
    required String? carManufacturerName,
    required String? carModelName,
    required int caseStatus,
    required int? carYear,
    required String? mileage,
    required String? note,
    required String? loseReason,
    required int? carPrice,
    required Timestamp? visitDate,
    required String? carRank,
  }) async {
    state = const AsyncLoading();

    CarManufacturer? carManufacturer;
    if (carManufacturerName != null) {
      carManufacturer = await ref
          .read(carManufacturerRepoProvider.notifier)
          .getCarManufacturerDataByName(
              carManufacturerName: carManufacturerName);
    }

    CarModel? carModel;
    if (carModelName != null && carManufacturer != null) {
      carModel = await ref
          .read(carModelRepoProvider(
                  carManufacturerId: carManufacturer.carManufacturerId)
              .notifier)
          .getCarModelDataByName(
            carModelName: carModelName,
          );
    }

    final Case caseData = Case(
      caseId: const Uuid().v4(),
      caseName: caseName,
      assignedEmployeeId: assignedEmployeeId,
      customerName: customerName,
      customerPhoneNumber: customerPhoneNumber,
      customerEmail: customerEmail,
      customerGender: customerGender,
      customerAddress: customerAddress,
      customerBirthDate: customerBirthDate,
      carModelId: carModel?.carModelId,
      carYear: carYear,
      mileage: mileage,
      caseStatus: caseStatus,
      note: note,
      loseReason: loseReason,
      assessmentAt: Timestamp.now(),
      createdAt: Timestamp.now(),
      updatedAt: Timestamp.now(),
      carPrice: carPrice,
      visitDate: visitDate,
      carManufacturerId: carManufacturer?.carManufacturerId,
      carRank: carRank,
      searchWords: generateSearchWords(customerName),
    );
    await ref.read(caseRepoProvider.notifier).createCase(
          caseData: caseData,
        );
    state = const AsyncData(null);
  }

  //ケース更新
  Future<void> updateCase({
    required Case caseData,
    required String caseName,
    required String assignedEmployeeId,
    required String customerName,
    required String? customerPhoneNumber,
    required String? customerEmail,
    required int customerGender,
    required String? customerAddress,
    required Timestamp? customerBirthDate,
    required String? carManufacturerName,
    required String? carModelName,
    required int caseStatus,
    required int? carYear,
    required String? mileage,
    required String? note,
    required String? loseReason,
    required int? carPrice,
    required Timestamp? visitDate,
    required String caseId,
  }) async {
    state = const AsyncLoading();

    CarManufacturer? carManufacturer;
    if (carManufacturerName != null) {
      carManufacturer = await ref
          .read(carManufacturerRepoProvider.notifier)
          .getCarManufacturerDataByName(
              carManufacturerName: carManufacturerName);
    }

    CarModel? carModel;
    if (carModelName != null && carManufacturer != null) {
      carModel = await ref
          .read(carModelRepoProvider(
                  carManufacturerId: carManufacturer.carManufacturerId)
              .notifier)
          .getCarModelDataByName(
            carModelName: carModelName,
          );
    }

    await ref.read(caseRepoProvider.notifier).updateCase(
          caseData: caseData.copyWith(
            caseName: caseName,
            searchWords: generateSearchWords(customerName),
            assignedEmployeeId: assignedEmployeeId,
            customerName: customerName,
            customerPhoneNumber: customerPhoneNumber,
            customerEmail: customerEmail,
            customerGender: customerGender,
            customerAddress: customerAddress,
            customerBirthDate: customerBirthDate,
            carManufacturerId: carManufacturer?.carManufacturerId,
            carModelId: carModel?.carModelId,
            carYear: carYear,
            mileage: mileage,
            caseStatus: caseStatus,
            note: note,
            loseReason: loseReason,
            carPrice: carPrice,
            visitDate: visitDate,
            updatedAt: Timestamp.now(),
          ),
        );
    state = const AsyncData(null);
  }

///////////////////////全従業員のステータス別データ//////////////////////////////////

  //ケース取得
  Future<Case> getCaseData({
    required String caseId,
  }) async {
    return await ref
        .read(caseRepoProvider.notifier)
        .getCaseData(caseId: caseId);
  }

//////////////////////////////////////////

  //ひと月の全ての案件リスト
  Future<List<Case?>> getSalesResultOfTheMonth({DateTime? targetDate}) async {
    final date = targetDate ?? DateTime.now();
    final startOfMonth = DateTime(date.year, date.month, 1);
    final endOfMonth = DateTime(date.year, date.month + 1, 1)
        .subtract(const Duration(milliseconds: 1));

    return ref.read(caseRepoProvider.notifier).getSalesResultOfTheMonth(
          startOfMonth: Timestamp.fromDate(startOfMonth),
          endOfMonth: Timestamp.fromDate(endOfMonth),
        );
  }

  //ひと月の案件の総額
  Future<double> getSalesSumOfTheMonth({DateTime? targetDate}) async {
    final List<Case?> allSales =
        await getSalesResultOfTheMonth(targetDate: targetDate);
    if (allSales.isEmpty) {
      return 0.0;
    }
    final sum = allSales.map((e) => e!.carPrice ?? 0).fold(
          0.0,
          (previousValue, carPrice) => previousValue + carPrice,
        );
    return sum;
  }

  //過去1年分の月ごとの案件総額リストを取得
  Future<List<double?>> getSalesSumForPastYear() async {
    List<double> monthlySales = [];
    final now = DateTime.now();

    for (int i = 0; i < 12; i++) {
      final targetDate = DateTime(now.year, now.month - i, 1);
      final salesSum = await getSalesSumOfTheMonth(targetDate: targetDate);
      monthlySales.add(salesSum);
    }
    if (monthlySales.isEmpty) {
      return [];
    }
    return monthlySales;
  }

  //過去1年分の月ごとの案件総数リストを取得
  Future<List<double?>> getSalesCountByStatusPastYear(
      {required int caseStatus}) async {
    List<double> monthlySalesCount = [];
    final now = DateTime.now();

    for (int i = 0; i < 12; i++) {
      final targetDate = DateTime(now.year, now.month - i, 1);
      final salesCount = await getSalesCountByStatus(
          caseStatus: caseStatus, targetDate: targetDate);

      // 案件個数をリストに追加
      monthlySalesCount.add(salesCount.toDouble());
    }
    if (monthlySalesCount.isEmpty) {
      return [];
    }
    return monthlySalesCount;
  }

  //ひと月の案件、ステータス別の個数
  Future<int> getSalesCountByStatus({
    DateTime? targetDate,
    required int caseStatus,
  }) async {
    final date = targetDate ?? DateTime.now();
    final startOfMonth = DateTime(date.year, date.month, 1);
    final endOfMonth = DateTime(date.year, date.month + 1, 1)
        .subtract(const Duration(milliseconds: 1));

    final allSales = await ref
        .read(caseRepoProvider.notifier)
        .getSalesResultOfTheMonthByStatus(
          startOfMonth: Timestamp.fromDate(startOfMonth),
          endOfMonth: Timestamp.fromDate(endOfMonth),
          caseStatus: caseStatus,
        );
    return allSales.length;
  }

////////////////////searchWordsフィールド生成///////////////////////////////////////
  //名前検索用フィールドの作成・更新(部分一致用の名前＋空白)
  List<String> generateSearchWords(String name) {
    final Set<String> searchWords = {};
    // 漢字の名前で検索ワードを生成
    searchWords.addAll(_generateWordsForString(name));
    // 空白を追加
    searchWords.add('');
    return searchWords.toList();
  }

  Set<String> _generateWordsForString(String text) {
    final Set<String> words = {};
    for (int length = 1; length <= text.length; length++) {
      for (int startIndex = 0;
          startIndex <= text.length - length;
          startIndex++) {
        words.add(text.substring(startIndex, startIndex + length));
      }
    }
    return words;
  }
  ////////////////////名前のフィールド生成///////////////////////////////////////
}

///////////////////////全従業員のステータス別データ//////////////////////////////////
// Streamでケース情報監視
@riverpod
Stream<Case?> watchCaseDataController(
  WatchCaseDataControllerRef ref, {
  required String caseId,
}) {
  return ref.read(caseRepoProvider.notifier).watchCaseData(caseId: caseId);
}

//全従業員で、ステータス別案件監視
@riverpod
Stream<List<Case?>> watchCaseListOfThisStatusController(
  WatchCaseListOfThisStatusControllerRef ref, {
  required int caseStatus,
}) {
  return ref
      .watch(caseRepoProvider.notifier)
      .watchCaseListOfThisStatus(caseStatus);
}

//全従業員で、稼働中のすべての案件監視
@riverpod
Stream<List<Case>> watchCaseListOfActiveStatus(
  WatchCaseListOfActiveStatusRef ref, {
  required int caseStatus,
}) {
  return ref.watch(caseRepoProvider.notifier).watchCaseListOfActiveStatus();
}

///////////////////////個別のステータス別データ//////////////////////////////////
//1従業員の、ステータス別案件監視
@riverpod
Stream<List<Case>> watchEmployeeCaseListByStatusController(
  WatchEmployeeCaseListByStatusControllerRef ref, {
  required int caseStatus,
  required String employeeId,
}) {
  return ref.watch(caseRepoProvider.notifier).watchEmployeeCaseListByStatus(
        employeeId: employeeId,
        caseStatus: caseStatus,
      );
}

//1従業員の、稼働中のすべての案件監視
@riverpod
Stream<List<Case>> watchEmployeeCaseListOfActiveStatusController(
  WatchEmployeeCaseListOfActiveStatusControllerRef ref, {
  required String employeeId,
}) {
  return ref
      .watch(caseRepoProvider.notifier)
      .watchEmployeeCaseListOfActiveStatus(
        employeeId: employeeId,
      );
}
