// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CaseImpl _$$CaseImplFromJson(Map<String, dynamic> json) => _$CaseImpl(
      caseId: json['caseId'] as String,
      caseName: json['caseName'] as String,
      assignedEmployeeId: json['assignedEmployeeId'] as String,
      customerName: json['customerName'] as String,
      searchWords: (json['searchWords'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      customerPhoneNumber: json['customerPhoneNumber'] as String?,
      customerEmail: json['customerEmail'] as String?,
      customerGender: (json['customerGender'] as num?)?.toInt(),
      customerAddress: json['customerAddress'] as String?,
      customerBirthDate: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['customerBirthDate'], const TimestampConverter().fromJson),
      carManufacturerId: json['carManufacturerId'] as String?,
      carModelId: json['carModelId'] as String?,
      carYear: (json['carYear'] as num?)?.toInt(),
      mileage: json['mileage'] as String?,
      caseStatus: (json['caseStatus'] as num?)?.toInt(),
      note: json['note'] as String?,
      loseReason: json['loseReason'] as String?,
      carPrice: (json['carPrice'] as num?)?.toInt(),
      carRank: json['carRank'] as String?,
      assessmentAt: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['assessmentAt'], const TimestampConverter().fromJson),
      visitDate: _$JsonConverterFromJson<Timestamp, Timestamp>(
          json['visitDate'], const TimestampConverter().fromJson),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$CaseImplToJson(_$CaseImpl instance) =>
    <String, dynamic>{
      'caseId': instance.caseId,
      'caseName': instance.caseName,
      'assignedEmployeeId': instance.assignedEmployeeId,
      'customerName': instance.customerName,
      'searchWords': instance.searchWords,
      'customerPhoneNumber': instance.customerPhoneNumber,
      'customerEmail': instance.customerEmail,
      'customerGender': instance.customerGender,
      'customerAddress': instance.customerAddress,
      'customerBirthDate': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.customerBirthDate, const TimestampConverter().toJson),
      'carManufacturerId': instance.carManufacturerId,
      'carModelId': instance.carModelId,
      'carYear': instance.carYear,
      'mileage': instance.mileage,
      'caseStatus': instance.caseStatus,
      'note': instance.note,
      'loseReason': instance.loseReason,
      'carPrice': instance.carPrice,
      'carRank': instance.carRank,
      'assessmentAt': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.assessmentAt, const TimestampConverter().toJson),
      'visitDate': _$JsonConverterToJson<Timestamp, Timestamp>(
          instance.visitDate, const TimestampConverter().toJson),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
