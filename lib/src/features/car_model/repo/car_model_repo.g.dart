// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_model_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$carModelRepoHash() => r'cceefa119ef1c1eab71bdc01d0da0495332eaf2e';

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

abstract class _$CarModelRepo
    extends BuildlessAutoDisposeNotifier<CollectionReference<CarModel>> {
  late final String carManufacturerId;

  CollectionReference<CarModel> build({
    required String carManufacturerId,
  });
}

/// See also [CarModelRepo].
@ProviderFor(CarModelRepo)
const carModelRepoProvider = CarModelRepoFamily();

/// See also [CarModelRepo].
class CarModelRepoFamily extends Family<CollectionReference<CarModel>> {
  /// See also [CarModelRepo].
  const CarModelRepoFamily();

  /// See also [CarModelRepo].
  CarModelRepoProvider call({
    required String carManufacturerId,
  }) {
    return CarModelRepoProvider(
      carManufacturerId: carManufacturerId,
    );
  }

  @override
  CarModelRepoProvider getProviderOverride(
    covariant CarModelRepoProvider provider,
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
  String? get name => r'carModelRepoProvider';
}

/// See also [CarModelRepo].
class CarModelRepoProvider extends AutoDisposeNotifierProviderImpl<CarModelRepo,
    CollectionReference<CarModel>> {
  /// See also [CarModelRepo].
  CarModelRepoProvider({
    required String carManufacturerId,
  }) : this._internal(
          () => CarModelRepo()..carManufacturerId = carManufacturerId,
          from: carModelRepoProvider,
          name: r'carModelRepoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$carModelRepoHash,
          dependencies: CarModelRepoFamily._dependencies,
          allTransitiveDependencies:
              CarModelRepoFamily._allTransitiveDependencies,
          carManufacturerId: carManufacturerId,
        );

  CarModelRepoProvider._internal(
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
  CollectionReference<CarModel> runNotifierBuild(
    covariant CarModelRepo notifier,
  ) {
    return notifier.build(
      carManufacturerId: carManufacturerId,
    );
  }

  @override
  Override overrideWith(CarModelRepo Function() create) {
    return ProviderOverride(
      origin: this,
      override: CarModelRepoProvider._internal(
        () => create()..carManufacturerId = carManufacturerId,
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
  AutoDisposeNotifierProviderElement<CarModelRepo,
      CollectionReference<CarModel>> createElement() {
    return _CarModelRepoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CarModelRepoProvider &&
        other.carManufacturerId == carManufacturerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, carManufacturerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CarModelRepoRef
    on AutoDisposeNotifierProviderRef<CollectionReference<CarModel>> {
  /// The parameter `carManufacturerId` of this provider.
  String get carManufacturerId;
}

class _CarModelRepoProviderElement extends AutoDisposeNotifierProviderElement<
    CarModelRepo, CollectionReference<CarModel>> with CarModelRepoRef {
  _CarModelRepoProviderElement(super.provider);

  @override
  String get carManufacturerId =>
      (origin as CarModelRepoProvider).carManufacturerId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
