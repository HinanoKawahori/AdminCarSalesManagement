// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_manufacturer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarManufacturer _$CarManufacturerFromJson(Map<String, dynamic> json) {
  return _CarManufacturer.fromJson(json);
}

/// @nodoc
mixin _$CarManufacturer {
  String get carManufacturerId => throw _privateConstructorUsedError;
  String get carManufacturerName => throw _privateConstructorUsedError;

  /// Serializes this CarManufacturer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarManufacturer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarManufacturerCopyWith<CarManufacturer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarManufacturerCopyWith<$Res> {
  factory $CarManufacturerCopyWith(
          CarManufacturer value, $Res Function(CarManufacturer) then) =
      _$CarManufacturerCopyWithImpl<$Res, CarManufacturer>;
  @useResult
  $Res call({String carManufacturerId, String carManufacturerName});
}

/// @nodoc
class _$CarManufacturerCopyWithImpl<$Res, $Val extends CarManufacturer>
    implements $CarManufacturerCopyWith<$Res> {
  _$CarManufacturerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarManufacturer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carManufacturerId = null,
    Object? carManufacturerName = null,
  }) {
    return _then(_value.copyWith(
      carManufacturerId: null == carManufacturerId
          ? _value.carManufacturerId
          : carManufacturerId // ignore: cast_nullable_to_non_nullable
              as String,
      carManufacturerName: null == carManufacturerName
          ? _value.carManufacturerName
          : carManufacturerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarManufacturerImplCopyWith<$Res>
    implements $CarManufacturerCopyWith<$Res> {
  factory _$$CarManufacturerImplCopyWith(_$CarManufacturerImpl value,
          $Res Function(_$CarManufacturerImpl) then) =
      __$$CarManufacturerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String carManufacturerId, String carManufacturerName});
}

/// @nodoc
class __$$CarManufacturerImplCopyWithImpl<$Res>
    extends _$CarManufacturerCopyWithImpl<$Res, _$CarManufacturerImpl>
    implements _$$CarManufacturerImplCopyWith<$Res> {
  __$$CarManufacturerImplCopyWithImpl(
      _$CarManufacturerImpl _value, $Res Function(_$CarManufacturerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarManufacturer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carManufacturerId = null,
    Object? carManufacturerName = null,
  }) {
    return _then(_$CarManufacturerImpl(
      carManufacturerId: null == carManufacturerId
          ? _value.carManufacturerId
          : carManufacturerId // ignore: cast_nullable_to_non_nullable
              as String,
      carManufacturerName: null == carManufacturerName
          ? _value.carManufacturerName
          : carManufacturerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarManufacturerImpl implements _CarManufacturer {
  _$CarManufacturerImpl(
      {required this.carManufacturerId, required this.carManufacturerName});

  factory _$CarManufacturerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarManufacturerImplFromJson(json);

  @override
  final String carManufacturerId;
  @override
  final String carManufacturerName;

  @override
  String toString() {
    return 'CarManufacturer(carManufacturerId: $carManufacturerId, carManufacturerName: $carManufacturerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarManufacturerImpl &&
            (identical(other.carManufacturerId, carManufacturerId) ||
                other.carManufacturerId == carManufacturerId) &&
            (identical(other.carManufacturerName, carManufacturerName) ||
                other.carManufacturerName == carManufacturerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, carManufacturerId, carManufacturerName);

  /// Create a copy of CarManufacturer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarManufacturerImplCopyWith<_$CarManufacturerImpl> get copyWith =>
      __$$CarManufacturerImplCopyWithImpl<_$CarManufacturerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarManufacturerImplToJson(
      this,
    );
  }
}

abstract class _CarManufacturer implements CarManufacturer {
  factory _CarManufacturer(
      {required final String carManufacturerId,
      required final String carManufacturerName}) = _$CarManufacturerImpl;

  factory _CarManufacturer.fromJson(Map<String, dynamic> json) =
      _$CarManufacturerImpl.fromJson;

  @override
  String get carManufacturerId;
  @override
  String get carManufacturerName;

  /// Create a copy of CarManufacturer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarManufacturerImplCopyWith<_$CarManufacturerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
