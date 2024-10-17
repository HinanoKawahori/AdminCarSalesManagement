// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchCarModelListControllerHash() =>
    r'c522785e9250f3d5fe5466c5b398a98378eaeb01';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [watchCarModelListController].
@ProviderFor(watchCarModelListController)
const watchCarModelListControllerProvider = WatchCarModelListControllerFamily();

/// See also [watchCarModelListController].
class WatchCarModelListControllerFamily
    extends Family<AsyncValue<List<CarModel>>> {
  /// See also [watchCarModelListController].
  const WatchCarModelListControllerFamily();

  /// See also [watchCarModelListController].
  WatchCarModelListControllerProvider call({
    required String carManufacturerId,
  }) {
    return WatchCarModelListControllerProvider(
      carManufacturerId: carManufacturerId,
    );
  }

  @override
  WatchCarModelListControllerProvider getProviderOverride(
    covariant WatchCarModelListControllerProvider provider,
  ) {
    return call(
      carManufacturerId: provider.carManufacturerId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchCarModelListControllerProvider';
}

/// See also [watchCarModelListController].
class WatchCarModelListControllerProvider
    extends AutoDisposeStreamProvider<List<CarModel>> {
  /// See also [watchCarModelListController].
  WatchCarModelListControllerProvider({
    required String carManufacturerId,
  }) : this._internal(
          (ref) => watchCarModelListController(
            ref as WatchCarModelListControllerRef,
            carManufacturerId: carManufacturerId,
          ),
          from: watchCarModelListControllerProvider,
          name: r'watchCarModelListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCarModelListControllerHash,
          dependencies: WatchCarModelListControllerFamily._dependencies,
          allTransitiveDependencies:
              WatchCarModelListControllerFamily._allTransitiveDependencies,
          carManufacturerId: carManufacturerId,
        );

  WatchCarModelListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.carManufacturerId,
  }) : super.internal();

  final String carManufacturerId;

  @override
  Override overrideWith(
    Stream<List<CarModel>> Function(WatchCarModelListControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCarModelListControllerProvider._internal(
        (ref) => create(ref as WatchCarModelListControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        carManufacturerId: carManufacturerId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<CarModel>> createElement() {
    return _WatchCarModelListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCarModelListControllerProvider &&
        other.carManufacturerId == carManufacturerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, carManufacturerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchCarModelListControllerRef
    on AutoDisposeStreamProviderRef<List<CarModel>> {
  /// The parameter `carManufacturerId` of this provider.
  String get carManufacturerId;
}

class _WatchCarModelListControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<CarModel>>
    with WatchCarModelListControllerRef {
  _WatchCarModelListControllerProviderElement(super.provider);

  @override
  String get carManufacturerId =>
      (origin as WatchCarModelListControllerProvider).carManufacturerId;
}

String _$watchCarModelDataControllerHash() =>
    r'704d7dd9c5476a0689a98a1b9658dbf4aefbb555';

/// See also [watchCarModelDataController].
@ProviderFor(watchCarModelDataController)
const watchCarModelDataControllerProvider = WatchCarModelDataControllerFamily();

/// See also [watchCarModelDataController].
class WatchCarModelDataControllerFamily extends Family<AsyncValue<CarModel?>> {
  /// See also [watchCarModelDataController].
  const WatchCarModelDataControllerFamily();

  /// See also [watchCarModelDataController].
  WatchCarModelDataControllerProvider call({
    required String? carModelId,
    required String? carManufacturerId,
  }) {
    return WatchCarModelDataControllerProvider(
      carModelId: carModelId,
      carManufacturerId: carManufacturerId,
    );
  }

  @override
  WatchCarModelDataControllerProvider getProviderOverride(
    covariant WatchCarModelDataControllerProvider provider,
  ) {
    return call(
      carModelId: provider.carModelId,
      carManufacturerId: provider.carManufacturerId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchCarModelDataControllerProvider';
}

/// See also [watchCarModelDataController].
class WatchCarModelDataControllerProvider
    extends AutoDisposeStreamProvider<CarModel?> {
  /// See also [watchCarModelDataController].
  WatchCarModelDataControllerProvider({
    required String? carModelId,
    required String? carManufacturerId,
  }) : this._internal(
          (ref) => watchCarModelDataController(
            ref as WatchCarModelDataControllerRef,
            carModelId: carModelId,
            carManufacturerId: carManufacturerId,
          ),
          from: watchCarModelDataControllerProvider,
          name: r'watchCarModelDataControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCarModelDataControllerHash,
          dependencies: WatchCarModelDataControllerFamily._dependencies,
          allTransitiveDependencies:
              WatchCarModelDataControllerFamily._allTransitiveDependencies,
          carModelId: carModelId,
          carManufacturerId: carManufacturerId,
        );

  WatchCarModelDataControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.carModelId,
    required this.carManufacturerId,
  }) : super.internal();

  final String? carModelId;
  final String? carManufacturerId;

  @override
  Override overrideWith(
    Stream<CarModel?> Function(WatchCarModelDataControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCarModelDataControllerProvider._internal(
        (ref) => create(ref as WatchCarModelDataControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        carModelId: carModelId,
        carManufacturerId: carManufacturerId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<CarModel?> createElement() {
    return _WatchCarModelDataControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCarModelDataControllerProvider &&
        other.carModelId == carModelId &&
        other.carManufacturerId == carManufacturerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, carModelId.hashCode);
    hash = _SystemHash.combine(hash, carManufacturerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchCarModelDataControllerRef
    on AutoDisposeStreamProviderRef<CarModel?> {
  /// The parameter `carModelId` of this provider.
  String? get carModelId;

  /// The parameter `carManufacturerId` of this provider.
  String? get carManufacturerId;
}

class _WatchCarModelDataControllerProviderElement
    extends AutoDisposeStreamProviderElement<CarModel?>
    with WatchCarModelDataControllerRef {
  _WatchCarModelDataControllerProviderElement(super.provider);

  @override
  String? get carModelId =>
      (origin as WatchCarModelDataControllerProvider).carModelId;
  @override
  String? get carManufacturerId =>
      (origin as WatchCarModelDataControllerProvider).carManufacturerId;
}

String _$carModelControllerHash() =>
    r'fc89032bae1d969355d49b27cc7887aee539c768';

/// See also [CarModelController].
@ProviderFor(CarModelController)
final carModelControllerProvider =
    AutoDisposeNotifierProvider<CarModelController, AsyncValue>.internal(
  CarModelController.new,
  name: r'carModelControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carModelControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CarModelController = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
