// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchEmployeeDataControllerHash() =>
    r'4100719095173e3ad8ab3bf10f7e0f20b5b61c99';

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

/// See also [watchEmployeeDataController].
@ProviderFor(watchEmployeeDataController)
const watchEmployeeDataControllerProvider = WatchEmployeeDataControllerFamily();

/// See also [watchEmployeeDataController].
class WatchEmployeeDataControllerFamily extends Family<AsyncValue<Employee?>> {
  /// See also [watchEmployeeDataController].
  const WatchEmployeeDataControllerFamily();

  /// See also [watchEmployeeDataController].
  WatchEmployeeDataControllerProvider call({
    required String employeeId,
  }) {
    return WatchEmployeeDataControllerProvider(
      employeeId: employeeId,
    );
  }

  @override
  WatchEmployeeDataControllerProvider getProviderOverride(
    covariant WatchEmployeeDataControllerProvider provider,
  ) {
    return call(
      employeeId: provider.employeeId,
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
  String? get name => r'watchEmployeeDataControllerProvider';
}

/// See also [watchEmployeeDataController].
class WatchEmployeeDataControllerProvider
    extends AutoDisposeStreamProvider<Employee?> {
  /// See also [watchEmployeeDataController].
  WatchEmployeeDataControllerProvider({
    required String employeeId,
  }) : this._internal(
          (ref) => watchEmployeeDataController(
            ref as WatchEmployeeDataControllerRef,
            employeeId: employeeId,
          ),
          from: watchEmployeeDataControllerProvider,
          name: r'watchEmployeeDataControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEmployeeDataControllerHash,
          dependencies: WatchEmployeeDataControllerFamily._dependencies,
          allTransitiveDependencies:
              WatchEmployeeDataControllerFamily._allTransitiveDependencies,
          employeeId: employeeId,
        );

  WatchEmployeeDataControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.employeeId,
  }) : super.internal();

  final String employeeId;

  @override
  Override overrideWith(
    Stream<Employee?> Function(WatchEmployeeDataControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEmployeeDataControllerProvider._internal(
        (ref) => create(ref as WatchEmployeeDataControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Employee?> createElement() {
    return _WatchEmployeeDataControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEmployeeDataControllerProvider &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchEmployeeDataControllerRef
    on AutoDisposeStreamProviderRef<Employee?> {
  /// The parameter `employeeId` of this provider.
  String get employeeId;
}

class _WatchEmployeeDataControllerProviderElement
    extends AutoDisposeStreamProviderElement<Employee?>
    with WatchEmployeeDataControllerRef {
  _WatchEmployeeDataControllerProviderElement(super.provider);

  @override
  String get employeeId =>
      (origin as WatchEmployeeDataControllerProvider).employeeId;
}

String _$watchAllEmployeeDataControllerHash() =>
    r'8f877472f97963cd87e5f9e2eca0d5ef03d107dc';

/// See also [watchAllEmployeeDataController].
@ProviderFor(watchAllEmployeeDataController)
final watchAllEmployeeDataControllerProvider =
    AutoDisposeStreamProvider<List<Employee>>.internal(
  watchAllEmployeeDataController,
  name: r'watchAllEmployeeDataControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchAllEmployeeDataControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchAllEmployeeDataControllerRef
    = AutoDisposeStreamProviderRef<List<Employee>>;
String _$employeeControllerHash() =>
    r'f057a7198bf590c4979fe6353f5231513d3f88f4';

/// See also [EmployeeController].
@ProviderFor(EmployeeController)
final employeeControllerProvider =
    AutoDisposeNotifierProvider<EmployeeController, AsyncValue>.internal(
  EmployeeController.new,
  name: r'employeeControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$employeeControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EmployeeController = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
