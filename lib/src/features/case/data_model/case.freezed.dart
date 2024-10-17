// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Case _$CaseFromJson(Map<String, dynamic> json) {
  return _Case.fromJson(json);
}

/// @nodoc
mixin _$Case {
  String get caseId => throw _privateConstructorUsedError;
  String get caseName => throw _privateConstructorUsedError;
  String get assignedEmployeeId => throw _privateConstructorUsedError;
  String get customerName => throw _privateConstructorUsedError;
  List<String> get searchWords => throw _privateConstructorUsedError;
  String? get customerPhoneNumber => throw _privateConstructorUsedError;
  String? get customerEmail => throw _privateConstructorUsedError;
  int? get customerGender => throw _privateConstructorUsedError;
  String? get customerAddress => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get customerBirthDate => throw _privateConstructorUsedError;
  String? get carManufacturerId => throw _privateConstructorUsedError;
  String? get carModelId => throw _privateConstructorUsedError;
  int? get carYear => throw _privateConstructorUsedError;
  String? get mileage => throw _privateConstructorUsedError;
  int? get caseStatus => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  String? get loseReason => throw _privateConstructorUsedError;
  int? get carPrice => throw _privateConstructorUsedError;
  String? get carRank => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get assessmentAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get visitDate => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Case to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Case
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CaseCopyWith<Case> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaseCopyWith<$Res> {
  factory $CaseCopyWith(Case value, $Res Function(Case) then) =
      _$CaseCopyWithImpl<$Res, Case>;
  @useResult
  $Res call(
      {String caseId,
      String caseName,
      String assignedEmployeeId,
      String customerName,
      List<String> searchWords,
      String? customerPhoneNumber,
      String? customerEmail,
      int? customerGender,
      String? customerAddress,
      @TimestampConverter() Timestamp? customerBirthDate,
      String? carManufacturerId,
      String? carModelId,
      int? carYear,
      String? mileage,
      int? caseStatus,
      String? note,
      String? loseReason,
      int? carPrice,
      String? carRank,
      @TimestampConverter() Timestamp? assessmentAt,
      @TimestampConverter() Timestamp? visitDate,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class _$CaseCopyWithImpl<$Res, $Val extends Case>
    implements $CaseCopyWith<$Res> {
  _$CaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Case
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caseId = null,
    Object? caseName = null,
    Object? assignedEmployeeId = null,
    Object? customerName = null,
    Object? searchWords = null,
    Object? customerPhoneNumber = freezed,
    Object? customerEmail = freezed,
    Object? customerGender = freezed,
    Object? customerAddress = freezed,
    Object? customerBirthDate = freezed,
    Object? carManufacturerId = freezed,
    Object? carModelId = freezed,
    Object? carYear = freezed,
    Object? mileage = freezed,
    Object? caseStatus = freezed,
    Object? note = freezed,
    Object? loseReason = freezed,
    Object? carPrice = freezed,
    Object? carRank = freezed,
    Object? assessmentAt = freezed,
    Object? visitDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      caseId: null == caseId
          ? _value.caseId
          : caseId // ignore: cast_nullable_to_non_nullable
              as String,
      caseName: null == caseName
          ? _value.caseName
          : caseName // ignore: cast_nullable_to_non_nullable
              as String,
      assignedEmployeeId: null == assignedEmployeeId
          ? _value.assignedEmployeeId
          : assignedEmployeeId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      searchWords: null == searchWords
          ? _value.searchWords
          : searchWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customerPhoneNumber: freezed == customerPhoneNumber
          ? _value.customerPhoneNumber
          : customerPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      customerGender: freezed == customerGender
          ? _value.customerGender
          : customerGender // ignore: cast_nullable_to_non_nullable
              as int?,
      customerAddress: freezed == customerAddress
          ? _value.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      customerBirthDate: freezed == customerBirthDate
          ? _value.customerBirthDate
          : customerBirthDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      carManufacturerId: freezed == carManufacturerId
          ? _value.carManufacturerId
          : carManufacturerId // ignore: cast_nullable_to_non_nullable
              as String?,
      carModelId: freezed == carModelId
          ? _value.carModelId
          : carModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      carYear: freezed == carYear
          ? _value.carYear
          : carYear // ignore: cast_nullable_to_non_nullable
              as int?,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      caseStatus: freezed == caseStatus
          ? _value.caseStatus
          : caseStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      loseReason: freezed == loseReason
          ? _value.loseReason
          : loseReason // ignore: cast_nullable_to_non_nullable
              as String?,
      carPrice: freezed == carPrice
          ? _value.carPrice
          : carPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      carRank: freezed == carRank
          ? _value.carRank
          : carRank // ignore: cast_nullable_to_non_nullable
              as String?,
      assessmentAt: freezed == assessmentAt
          ? _value.assessmentAt
          : assessmentAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      visitDate: freezed == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CaseImplCopyWith<$Res> implements $CaseCopyWith<$Res> {
  factory _$$CaseImplCopyWith(
          _$CaseImpl value, $Res Function(_$CaseImpl) then) =
      __$$CaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String caseId,
      String caseName,
      String assignedEmployeeId,
      String customerName,
      List<String> searchWords,
      String? customerPhoneNumber,
      String? customerEmail,
      int? customerGender,
      String? customerAddress,
      @TimestampConverter() Timestamp? customerBirthDate,
      String? carManufacturerId,
      String? carModelId,
      int? carYear,
      String? mileage,
      int? caseStatus,
      String? note,
      String? loseReason,
      int? carPrice,
      String? carRank,
      @TimestampConverter() Timestamp? assessmentAt,
      @TimestampConverter() Timestamp? visitDate,
      @TimestampConverter() Timestamp createdAt,
      @TimestampConverter() Timestamp updatedAt});
}

/// @nodoc
class __$$CaseImplCopyWithImpl<$Res>
    extends _$CaseCopyWithImpl<$Res, _$CaseImpl>
    implements _$$CaseImplCopyWith<$Res> {
  __$$CaseImplCopyWithImpl(_$CaseImpl _value, $Res Function(_$CaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of Case
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? caseId = null,
    Object? caseName = null,
    Object? assignedEmployeeId = null,
    Object? customerName = null,
    Object? searchWords = null,
    Object? customerPhoneNumber = freezed,
    Object? customerEmail = freezed,
    Object? customerGender = freezed,
    Object? customerAddress = freezed,
    Object? customerBirthDate = freezed,
    Object? carManufacturerId = freezed,
    Object? carModelId = freezed,
    Object? carYear = freezed,
    Object? mileage = freezed,
    Object? caseStatus = freezed,
    Object? note = freezed,
    Object? loseReason = freezed,
    Object? carPrice = freezed,
    Object? carRank = freezed,
    Object? assessmentAt = freezed,
    Object? visitDate = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CaseImpl(
      caseId: null == caseId
          ? _value.caseId
          : caseId // ignore: cast_nullable_to_non_nullable
              as String,
      caseName: null == caseName
          ? _value.caseName
          : caseName // ignore: cast_nullable_to_non_nullable
              as String,
      assignedEmployeeId: null == assignedEmployeeId
          ? _value.assignedEmployeeId
          : assignedEmployeeId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      searchWords: null == searchWords
          ? _value._searchWords
          : searchWords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      customerPhoneNumber: freezed == customerPhoneNumber
          ? _value.customerPhoneNumber
          : customerPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      customerEmail: freezed == customerEmail
          ? _value.customerEmail
          : customerEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      customerGender: freezed == customerGender
          ? _value.customerGender
          : customerGender // ignore: cast_nullable_to_non_nullable
              as int?,
      customerAddress: freezed == customerAddress
          ? _value.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      customerBirthDate: freezed == customerBirthDate
          ? _value.customerBirthDate
          : customerBirthDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      carManufacturerId: freezed == carManufacturerId
          ? _value.carManufacturerId
          : carManufacturerId // ignore: cast_nullable_to_non_nullable
              as String?,
      carModelId: freezed == carModelId
          ? _value.carModelId
          : carModelId // ignore: cast_nullable_to_non_nullable
              as String?,
      carYear: freezed == carYear
          ? _value.carYear
          : carYear // ignore: cast_nullable_to_non_nullable
              as int?,
      mileage: freezed == mileage
          ? _value.mileage
          : mileage // ignore: cast_nullable_to_non_nullable
              as String?,
      caseStatus: freezed == caseStatus
          ? _value.caseStatus
          : caseStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      loseReason: freezed == loseReason
          ? _value.loseReason
          : loseReason // ignore: cast_nullable_to_non_nullable
              as String?,
      carPrice: freezed == carPrice
          ? _value.carPrice
          : carPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      carRank: freezed == carRank
          ? _value.carRank
          : carRank // ignore: cast_nullable_to_non_nullable
              as String?,
      assessmentAt: freezed == assessmentAt
          ? _value.assessmentAt
          : assessmentAt // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      visitDate: freezed == visitDate
          ? _value.visitDate
          : visitDate // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CaseImpl implements _Case {
  _$CaseImpl(
      {required this.caseId,
      required this.caseName,
      required this.assignedEmployeeId,
      required this.customerName,
      required final List<String> searchWords,
      required this.customerPhoneNumber,
      required this.customerEmail,
      required this.customerGender,
      required this.customerAddress,
      @TimestampConverter() required this.customerBirthDate,
      required this.carManufacturerId,
      required this.carModelId,
      required this.carYear,
      required this.mileage,
      required this.caseStatus,
      required this.note,
      required this.loseReason,
      required this.carPrice,
      required this.carRank,
      @TimestampConverter() required this.assessmentAt,
      @TimestampConverter() required this.visitDate,
      @TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.updatedAt})
      : _searchWords = searchWords;

  factory _$CaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CaseImplFromJson(json);

  @override
  final String caseId;
  @override
  final String caseName;
  @override
  final String assignedEmployeeId;
  @override
  final String customerName;
  final List<String> _searchWords;
  @override
  List<String> get searchWords {
    if (_searchWords is EqualUnmodifiableListView) return _searchWords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchWords);
  }

  @override
  final String? customerPhoneNumber;
  @override
  final String? customerEmail;
  @override
  final int? customerGender;
  @override
  final String? customerAddress;
  @override
  @TimestampConverter()
  final Timestamp? customerBirthDate;
  @override
  final String? carManufacturerId;
  @override
  final String? carModelId;
  @override
  final int? carYear;
  @override
  final String? mileage;
  @override
  final int? caseStatus;
  @override
  final String? note;
  @override
  final String? loseReason;
  @override
  final int? carPrice;
  @override
  final String? carRank;
  @override
  @TimestampConverter()
  final Timestamp? assessmentAt;
  @override
  @TimestampConverter()
  final Timestamp? visitDate;
  @override
  @TimestampConverter()
  final Timestamp createdAt;
  @override
  @TimestampConverter()
  final Timestamp updatedAt;

  @override
  String toString() {
    return 'Case(caseId: $caseId, caseName: $caseName, assignedEmployeeId: $assignedEmployeeId, customerName: $customerName, searchWords: $searchWords, customerPhoneNumber: $customerPhoneNumber, customerEmail: $customerEmail, customerGender: $customerGender, customerAddress: $customerAddress, customerBirthDate: $customerBirthDate, carManufacturerId: $carManufacturerId, carModelId: $carModelId, carYear: $carYear, mileage: $mileage, caseStatus: $caseStatus, note: $note, loseReason: $loseReason, carPrice: $carPrice, carRank: $carRank, assessmentAt: $assessmentAt, visitDate: $visitDate, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CaseImpl &&
            (identical(other.caseId, caseId) || other.caseId == caseId) &&
            (identical(other.caseName, caseName) ||
                other.caseName == caseName) &&
            (identical(other.assignedEmployeeId, assignedEmployeeId) ||
                other.assignedEmployeeId == assignedEmployeeId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            const DeepCollectionEquality()
                .equals(other._searchWords, _searchWords) &&
            (identical(other.customerPhoneNumber, customerPhoneNumber) ||
                other.customerPhoneNumber == customerPhoneNumber) &&
            (identical(other.customerEmail, customerEmail) ||
                other.customerEmail == customerEmail) &&
            (identical(other.customerGender, customerGender) ||
                other.customerGender == customerGender) &&
            (identical(other.customerAddress, customerAddress) ||
                other.customerAddress == customerAddress) &&
            (identical(other.customerBirthDate, customerBirthDate) ||
                other.customerBirthDate == customerBirthDate) &&
            (identical(other.carManufacturerId, carManufacturerId) ||
                other.carManufacturerId == carManufacturerId) &&
            (identical(other.carModelId, carModelId) ||
                other.carModelId == carModelId) &&
            (identical(other.carYear, carYear) || other.carYear == carYear) &&
            (identical(other.mileage, mileage) || other.mileage == mileage) &&
            (identical(other.caseStatus, caseStatus) ||
                other.caseStatus == caseStatus) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.loseReason, loseReason) ||
                other.loseReason == loseReason) &&
            (identical(other.carPrice, carPrice) ||
                other.carPrice == carPrice) &&
            (identical(other.carRank, carRank) || other.carRank == carRank) &&
            (identical(other.assessmentAt, assessmentAt) ||
                other.assessmentAt == assessmentAt) &&
            (identical(other.visitDate, visitDate) ||
                other.visitDate == visitDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        caseId,
        caseName,
        assignedEmployeeId,
        customerName,
        const DeepCollectionEquality().hash(_searchWords),
        customerPhoneNumber,
        customerEmail,
        customerGender,
        customerAddress,
        customerBirthDate,
        carManufacturerId,
        carModelId,
        carYear,
        mileage,
        caseStatus,
        note,
        loseReason,
        carPrice,
        carRank,
        assessmentAt,
        visitDate,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Case
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CaseImplCopyWith<_$CaseImpl> get copyWith =>
      __$$CaseImplCopyWithImpl<_$CaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CaseImplToJson(
      this,
    );
  }
}

abstract class _Case implements Case {
  factory _Case(
      {required final String caseId,
      required final String caseName,
      required final String assignedEmployeeId,
      required final String customerName,
      required final List<String> searchWords,
      required final String? customerPhoneNumber,
      required final String? customerEmail,
      required final int? customerGender,
      required final String? customerAddress,
      @TimestampConverter() required final Timestamp? customerBirthDate,
      required final String? carManufacturerId,
      required final String? carModelId,
      required final int? carYear,
      required final String? mileage,
      required final int? caseStatus,
      required final String? note,
      required final String? loseReason,
      required final int? carPrice,
      required final String? carRank,
      @TimestampConverter() required final Timestamp? assessmentAt,
      @TimestampConverter() required final Timestamp? visitDate,
      @TimestampConverter() required final Timestamp createdAt,
      @TimestampConverter() required final Timestamp updatedAt}) = _$CaseImpl;

  factory _Case.fromJson(Map<String, dynamic> json) = _$CaseImpl.fromJson;

  @override
  String get caseId;
  @override
  String get caseName;
  @override
  String get assignedEmployeeId;
  @override
  String get customerName;
  @override
  List<String> get searchWords;
  @override
  String? get customerPhoneNumber;
  @override
  String? get customerEmail;
  @override
  int? get customerGender;
  @override
  String? get customerAddress;
  @override
  @TimestampConverter()
  Timestamp? get customerBirthDate;
  @override
  String? get carManufacturerId;
  @override
  String? get carModelId;
  @override
  int? get carYear;
  @override
  String? get mileage;
  @override
  int? get caseStatus;
  @override
  String? get note;
  @override
  String? get loseReason;
  @override
  int? get carPrice;
  @override
  String? get carRank;
  @override
  @TimestampConverter()
  Timestamp? get assessmentAt;
  @override
  @TimestampConverter()
  Timestamp? get visitDate;
  @override
  @TimestampConverter()
  Timestamp get createdAt;
  @override
  @TimestampConverter()
  Timestamp get updatedAt;

  /// Create a copy of Case
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CaseImplCopyWith<_$CaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
