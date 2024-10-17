// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeImpl _$$EmployeeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeImpl(
      employeeId: json['employeeId'] as String,
      employeeName: json['employeeName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      address: json['address'] as String,
      birthDate:
          const TimestampConverter().fromJson(json['birthDate'] as Timestamp),
      role: (json['role'] as num).toInt(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$EmployeeImplToJson(_$EmployeeImpl instance) =>
    <String, dynamic>{
      'employeeId': instance.employeeId,
      'employeeName': instance.employeeName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'birthDate': const TimestampConverter().toJson(instance.birthDate),
      'role': instance.role,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
