import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../function/timestamp_converter.dart';

part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  factory Employee({
    required String employeeId,
    required String employeeName,
    required String email,
    required String phoneNumber,
    required String address,
    @TimestampConverter() required Timestamp birthDate,
    required int role,
    @TimestampConverter() required Timestamp createdAt,
    @TimestampConverter() required Timestamp updatedAt,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
