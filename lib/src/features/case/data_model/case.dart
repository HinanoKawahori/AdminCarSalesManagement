import 'package:admin_car_sales_management/src/function/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'case.freezed.dart';
part 'case.g.dart';

@freezed
class Case with _$Case {
  factory Case({
    required String caseId,
    required String caseName,
    required String assignedEmployeeId,
    required String customerName,
    required List<String> searchWords,
    required String? customerPhoneNumber,
    required String? customerEmail,
    required int? customerGender,
    required String? customerAddress,
    @TimestampConverter() required Timestamp? customerBirthDate,
    required String? carManufacturerId,
    required String? carModelId,
    required int? carYear,
    required String? mileage,
    required int? caseStatus,
    required String? note,
    required String? loseReason,
    required int? carPrice,
    required String? carRank,
    @TimestampConverter() required Timestamp? assessmentAt,
    @TimestampConverter() required Timestamp? visitDate,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _Case;

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);
}
