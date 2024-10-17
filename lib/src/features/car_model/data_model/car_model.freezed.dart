// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CarModel _$CarModelFromJson(Map<String, dynamic> json) {
  return _CarModel.fromJson(json);
}

/// @nodoc
mixin _$CarModel {
  String get carModelId => throw _privateConstructorUsedError;
  String get carModelName => throw _privateConstructorUsedError;

  /// Serializes this CarModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CarModelCopyWith<CarModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarModelCopyWith<$Res> {
  factory $CarModelCopyWith(CarModel value, $Res Function(CarModel) then) =
      _$CarModelCopyWithImpl<$Res, CarModel>;
  @useResult
  $Res call({String carModelId, String carModelName});
}

/// @nodoc
class _$CarModelCopyWithImpl<$Res, $Val extends CarModel>
    implements $CarModelCopyWith<$Res> {
  _$CarModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carModelId = null,
    Object? carModelName = null,
  }) {
    return _then(_value.copyWith(
      carModelId: null == carModelId
          ? _value.carModelId
          : carModelId // ignore: cast_nullable_to_non_nullable
              as String,
      carModelName: null == carModelName
          ? _value.carModelName
          : carModelName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CarModelImplCopyWith<$Res>
    implements $CarModelCopyWith<$Res> {
  factory _$$CarModelImplCopyWith(
          _$CarModelImpl value, $Res Function(_$CarModelImpl) then) =
      __$$CarModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String carModelId, String carModelName});
}

/// @nodoc
class __$$CarModelImplCopyWithImpl<$Res>
    extends _$CarModelCopyWithImpl<$Res, _$CarModelImpl>
    implements _$$CarModelImplCopyWith<$Res> {
  __$$CarModelImplCopyWithImpl(
      _$CarModelImpl _value, $Res Function(_$CarModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CarModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carModelId = null,
    Object? carModelName = null,
  }) {
    return _then(_$CarModelImpl(
      carModelId: null == carModelId
          ? _value.carModelId
          : carModelId // ignore: cast_nullable_to_non_nullable
              as String,
      carModelName: null == carModelName
          ? _value.carModelName
          : carModelName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CarModelImpl implements _CarModel {
  _$CarModelImpl({required this.carModelId, required this.carModelName});

  factory _$CarModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CarModelImplFromJson(json);

  @override
  final String carModelId;
  @override
  final String carModelName;

  @override
  String toString() {
    return 'CarModel(carModelId: $carModelId, carModelName: $carModelName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CarModelImpl &&
            (identical(other.carModelId, carModelId) ||
                other.carModelId == carModelId) &&
            (identical(other.carModelName, carModelName) ||
                other.carModelName == carModelName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, carModelId, carModelName);

  /// Create a copy of CarModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CarModelImplCopyWith<_$CarModelImpl> get copyWith =>
      __$$CarModelImplCopyWithImpl<_$CarModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CarModelImplToJson(
      this,
    );
  }
}

abstract class _CarModel implements CarModel {
  factory _CarModel(
      {required final String carModelId,
      required final String carModelName}) = _$CarModelImpl;

  factory _CarModel.fromJson(Map<String, dynamic> json) =
      _$CarModelImpl.fromJson;

  @override
  String get carModelId;
  @override
  String get carModelName;

  /// Create a copy of CarModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CarModelImplCopyWith<_$CarModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
