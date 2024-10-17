// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_manufacturer_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchCarManufacturerDataControllerHash() =>
    r'209165efe148cee93ba9b717590575fe2f51b3a8';

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

/// See also [watchCarManufacturerDataController].
@ProviderFor(watchCarManufacturerDataController)
const watchCarManufacturerDataControllerProvider =
    WatchCarManufacturerDataControllerFamily();

/// See also [watchCarManufacturerDataController].
class WatchCarManufacturerDataControllerFamily
    extends Family<AsyncValue<CarManufacturer?>> {
  /// See also [watchCarManufacturerDataController].
  const WatchCarManufacturerDataControllerFamily();

  /// See also [watchCarManufacturerDataController].
  WatchCarManufacturerDataControllerProvider call({
    required String? carManufacturerId,
  }) {
    return WatchCarManufacturerDataControllerProvider(
      carManufacturerId: carManufacturerId,
    );
  }

  @override
  WatchCarManufacturerDataControllerProvider getProviderOverride(
    covariant WatchCarManufacturerDataControllerProvider provider,
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
  String? get name => r'watchCarManufacturerDataControllerProvider';
}

/// See also [watchCarManufacturerDataController].
class WatchCarManufacturerDataControllerProvider
    extends AutoDisposeStreamProvider<CarManufacturer?> {
  /// See also [watchCarManufacturerDataController].
  WatchCarManufacturerDataControllerProvider({
    required String? carManufacturerId,
  }) : this._internal(
          (ref) => watchCarManufacturerDataController(
            ref as WatchCarManufacturerDataControllerRef,
            carManufacturerId: carManufacturerId,
          ),
          from: watchCarManufacturerDataControllerProvider,
          name: r'watchCarManufacturerDataControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCarManufacturerDataControllerHash,
          dependencies: WatchCarManufacturerDataControllerFamily._dependencies,
          allTransitiveDependencies: WatchCarManufacturerDataControllerFamily
              ._allTransitiveDependencies,
          carManufacturerId: carManufacturerId,
        );

  WatchCarManufacturerDataControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.carManufacturerId,
  }) : super.internal();

  final String? carManufacturerId;

  @override
  Override overrideWith(
    Stream<CarManufacturer?> Function(
            WatchCarManufacturerDataControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCarManufacturerDataControllerProvider._internal(
        (ref) => create(ref as WatchCarManufacturerDataControllerRef),
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
  AutoDisposeStreamProviderElement<CarManufacturer?> createElement() {
    return _WatchCarManufacturerDataControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCarManufacturerDataControllerProvider &&
        other.carManufacturerId == carManufacturerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, carManufacturerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchCarManufacturerDataControllerRef
    on AutoDisposeStreamProviderRef<CarManufacturer?> {
  /// The parameter `carManufacturerId` of this provider.
  String? get carManufacturerId;
}

class _WatchCarManufacturerDataControllerProviderElement
    extends AutoDisposeStreamProviderElement<CarManufacturer?>
    with WatchCarManufacturerDataControllerRef {
  _WatchCarManufacturerDataControllerProviderElement(super.provider);

  @override
  String? get carManufacturerId =>
      (origin as WatchCarManufacturerDataControllerProvider).carManufacturerId;
}

String _$watchCarManufactureListControllerHash() =>
    r'76a7c663d46a3fe44e7022740269dfb268f0d318';

/// See also [watchCarManufactureListController].
@ProviderFor(watchCarManufactureListController)
final watchCarManufactureListControllerProvider =
    AutoDisposeStreamProvider<List<CarManufacturer>>.internal(
  watchCarManufactureListController,
  name: r'watchCarManufactureListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchCarManufactureListControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchCarManufactureListControllerRef
    = AutoDisposeStreamProviderRef<List<CarManufacturer>>;
String _$carManufacturerControllerHash() =>
    r'96aa371165db81d765f8be22222d4a01a5ca6cde';

/// See also [CarManufacturerController].
@ProviderFor(CarManufacturerController)
final carManufacturerControllerProvider =
    AutoDisposeNotifierProvider<CarManufacturerController, AsyncValue>.internal(
  CarManufacturerController.new,
  name: r'carManufacturerControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$carManufacturerControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CarManufacturerController = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
