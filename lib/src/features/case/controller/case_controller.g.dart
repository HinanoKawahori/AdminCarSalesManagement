// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$watchCaseDataControllerHash() =>
    r'c34a9de372a3c34f45695869ef52024645ac7d5b';

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

///////////////////////全従業員のステータス別データ//////////////////////////////////
///
/// Copied from [watchCaseDataController].
@ProviderFor(watchCaseDataController)
const watchCaseDataControllerProvider = WatchCaseDataControllerFamily();

///////////////////////全従業員のステータス別データ//////////////////////////////////
///
/// Copied from [watchCaseDataController].
class WatchCaseDataControllerFamily extends Family<AsyncValue<Case?>> {
  ///////////////////////全従業員のステータス別データ//////////////////////////////////
  ///
  /// Copied from [watchCaseDataController].
  const WatchCaseDataControllerFamily();

  ///////////////////////全従業員のステータス別データ//////////////////////////////////
  ///
  /// Copied from [watchCaseDataController].
  WatchCaseDataControllerProvider call({
    required String caseId,
  }) {
    return WatchCaseDataControllerProvider(
      caseId: caseId,
    );
  }

  @override
  WatchCaseDataControllerProvider getProviderOverride(
    covariant WatchCaseDataControllerProvider provider,
  ) {
    return call(
      caseId: provider.caseId,
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
  String? get name => r'watchCaseDataControllerProvider';
}

///////////////////////全従業員のステータス別データ//////////////////////////////////
///
/// Copied from [watchCaseDataController].
class WatchCaseDataControllerProvider extends AutoDisposeStreamProvider<Case?> {
  ///////////////////////全従業員のステータス別データ//////////////////////////////////
  ///
  /// Copied from [watchCaseDataController].
  WatchCaseDataControllerProvider({
    required String caseId,
  }) : this._internal(
          (ref) => watchCaseDataController(
            ref as WatchCaseDataControllerRef,
            caseId: caseId,
          ),
          from: watchCaseDataControllerProvider,
          name: r'watchCaseDataControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCaseDataControllerHash,
          dependencies: WatchCaseDataControllerFamily._dependencies,
          allTransitiveDependencies:
              WatchCaseDataControllerFamily._allTransitiveDependencies,
          caseId: caseId,
        );

  WatchCaseDataControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseId,
  }) : super.internal();

  final String caseId;

  @override
  Override overrideWith(
    Stream<Case?> Function(WatchCaseDataControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCaseDataControllerProvider._internal(
        (ref) => create(ref as WatchCaseDataControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseId: caseId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Case?> createElement() {
    return _WatchCaseDataControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCaseDataControllerProvider && other.caseId == caseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchCaseDataControllerRef on AutoDisposeStreamProviderRef<Case?> {
  /// The parameter `caseId` of this provider.
  String get caseId;
}

class _WatchCaseDataControllerProviderElement
    extends AutoDisposeStreamProviderElement<Case?>
    with WatchCaseDataControllerRef {
  _WatchCaseDataControllerProviderElement(super.provider);

  @override
  String get caseId => (origin as WatchCaseDataControllerProvider).caseId;
}

String _$watchCaseListOfThisStatusControllerHash() =>
    r'a5f9ac4d02a1774a98e3b018ed00be3f6734fc3f';

/// See also [watchCaseListOfThisStatusController].
@ProviderFor(watchCaseListOfThisStatusController)
const watchCaseListOfThisStatusControllerProvider =
    WatchCaseListOfThisStatusControllerFamily();

/// See also [watchCaseListOfThisStatusController].
class WatchCaseListOfThisStatusControllerFamily
    extends Family<AsyncValue<List<Case?>>> {
  /// See also [watchCaseListOfThisStatusController].
  const WatchCaseListOfThisStatusControllerFamily();

  /// See also [watchCaseListOfThisStatusController].
  WatchCaseListOfThisStatusControllerProvider call({
    required int caseStatus,
  }) {
    return WatchCaseListOfThisStatusControllerProvider(
      caseStatus: caseStatus,
    );
  }

  @override
  WatchCaseListOfThisStatusControllerProvider getProviderOverride(
    covariant WatchCaseListOfThisStatusControllerProvider provider,
  ) {
    return call(
      caseStatus: provider.caseStatus,
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
  String? get name => r'watchCaseListOfThisStatusControllerProvider';
}

/// See also [watchCaseListOfThisStatusController].
class WatchCaseListOfThisStatusControllerProvider
    extends AutoDisposeStreamProvider<List<Case?>> {
  /// See also [watchCaseListOfThisStatusController].
  WatchCaseListOfThisStatusControllerProvider({
    required int caseStatus,
  }) : this._internal(
          (ref) => watchCaseListOfThisStatusController(
            ref as WatchCaseListOfThisStatusControllerRef,
            caseStatus: caseStatus,
          ),
          from: watchCaseListOfThisStatusControllerProvider,
          name: r'watchCaseListOfThisStatusControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCaseListOfThisStatusControllerHash,
          dependencies: WatchCaseListOfThisStatusControllerFamily._dependencies,
          allTransitiveDependencies: WatchCaseListOfThisStatusControllerFamily
              ._allTransitiveDependencies,
          caseStatus: caseStatus,
        );

  WatchCaseListOfThisStatusControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseStatus,
  }) : super.internal();

  final int caseStatus;

  @override
  Override overrideWith(
    Stream<List<Case?>> Function(
            WatchCaseListOfThisStatusControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCaseListOfThisStatusControllerProvider._internal(
        (ref) => create(ref as WatchCaseListOfThisStatusControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseStatus: caseStatus,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Case?>> createElement() {
    return _WatchCaseListOfThisStatusControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCaseListOfThisStatusControllerProvider &&
        other.caseStatus == caseStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchCaseListOfThisStatusControllerRef
    on AutoDisposeStreamProviderRef<List<Case?>> {
  /// The parameter `caseStatus` of this provider.
  int get caseStatus;
}

class _WatchCaseListOfThisStatusControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<Case?>>
    with WatchCaseListOfThisStatusControllerRef {
  _WatchCaseListOfThisStatusControllerProviderElement(super.provider);

  @override
  int get caseStatus =>
      (origin as WatchCaseListOfThisStatusControllerProvider).caseStatus;
}

String _$watchCaseListOfActiveStatusHash() =>
    r'2b2b29433e46baac8b9e448f526fa020677a6b07';

/// See also [watchCaseListOfActiveStatus].
@ProviderFor(watchCaseListOfActiveStatus)
const watchCaseListOfActiveStatusProvider = WatchCaseListOfActiveStatusFamily();

/// See also [watchCaseListOfActiveStatus].
class WatchCaseListOfActiveStatusFamily extends Family<AsyncValue<List<Case>>> {
  /// See also [watchCaseListOfActiveStatus].
  const WatchCaseListOfActiveStatusFamily();

  /// See also [watchCaseListOfActiveStatus].
  WatchCaseListOfActiveStatusProvider call({
    required int caseStatus,
  }) {
    return WatchCaseListOfActiveStatusProvider(
      caseStatus: caseStatus,
    );
  }

  @override
  WatchCaseListOfActiveStatusProvider getProviderOverride(
    covariant WatchCaseListOfActiveStatusProvider provider,
  ) {
    return call(
      caseStatus: provider.caseStatus,
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
  String? get name => r'watchCaseListOfActiveStatusProvider';
}

/// See also [watchCaseListOfActiveStatus].
class WatchCaseListOfActiveStatusProvider
    extends AutoDisposeStreamProvider<List<Case>> {
  /// See also [watchCaseListOfActiveStatus].
  WatchCaseListOfActiveStatusProvider({
    required int caseStatus,
  }) : this._internal(
          (ref) => watchCaseListOfActiveStatus(
            ref as WatchCaseListOfActiveStatusRef,
            caseStatus: caseStatus,
          ),
          from: watchCaseListOfActiveStatusProvider,
          name: r'watchCaseListOfActiveStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCaseListOfActiveStatusHash,
          dependencies: WatchCaseListOfActiveStatusFamily._dependencies,
          allTransitiveDependencies:
              WatchCaseListOfActiveStatusFamily._allTransitiveDependencies,
          caseStatus: caseStatus,
        );

  WatchCaseListOfActiveStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseStatus,
  }) : super.internal();

  final int caseStatus;

  @override
  Override overrideWith(
    Stream<List<Case>> Function(WatchCaseListOfActiveStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCaseListOfActiveStatusProvider._internal(
        (ref) => create(ref as WatchCaseListOfActiveStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseStatus: caseStatus,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Case>> createElement() {
    return _WatchCaseListOfActiveStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCaseListOfActiveStatusProvider &&
        other.caseStatus == caseStatus;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseStatus.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchCaseListOfActiveStatusRef
    on AutoDisposeStreamProviderRef<List<Case>> {
  /// The parameter `caseStatus` of this provider.
  int get caseStatus;
}

class _WatchCaseListOfActiveStatusProviderElement
    extends AutoDisposeStreamProviderElement<List<Case>>
    with WatchCaseListOfActiveStatusRef {
  _WatchCaseListOfActiveStatusProviderElement(super.provider);

  @override
  int get caseStatus =>
      (origin as WatchCaseListOfActiveStatusProvider).caseStatus;
}

String _$watchEmployeeCaseListByStatusControllerHash() =>
    r'112a42844cd1bb52567523950a91c0923b9256c8';

///////////////////////個別のステータス別データ//////////////////////////////////
///
/// Copied from [watchEmployeeCaseListByStatusController].
@ProviderFor(watchEmployeeCaseListByStatusController)
const watchEmployeeCaseListByStatusControllerProvider =
    WatchEmployeeCaseListByStatusControllerFamily();

///////////////////////個別のステータス別データ//////////////////////////////////
///
/// Copied from [watchEmployeeCaseListByStatusController].
class WatchEmployeeCaseListByStatusControllerFamily
    extends Family<AsyncValue<List<Case>>> {
  ///////////////////////個別のステータス別データ//////////////////////////////////
  ///
  /// Copied from [watchEmployeeCaseListByStatusController].
  const WatchEmployeeCaseListByStatusControllerFamily();

  ///////////////////////個別のステータス別データ//////////////////////////////////
  ///
  /// Copied from [watchEmployeeCaseListByStatusController].
  WatchEmployeeCaseListByStatusControllerProvider call({
    required int caseStatus,
    required String employeeId,
  }) {
    return WatchEmployeeCaseListByStatusControllerProvider(
      caseStatus: caseStatus,
      employeeId: employeeId,
    );
  }

  @override
  WatchEmployeeCaseListByStatusControllerProvider getProviderOverride(
    covariant WatchEmployeeCaseListByStatusControllerProvider provider,
  ) {
    return call(
      caseStatus: provider.caseStatus,
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
  String? get name => r'watchEmployeeCaseListByStatusControllerProvider';
}

///////////////////////個別のステータス別データ//////////////////////////////////
///
/// Copied from [watchEmployeeCaseListByStatusController].
class WatchEmployeeCaseListByStatusControllerProvider
    extends AutoDisposeStreamProvider<List<Case>> {
  ///////////////////////個別のステータス別データ//////////////////////////////////
  ///
  /// Copied from [watchEmployeeCaseListByStatusController].
  WatchEmployeeCaseListByStatusControllerProvider({
    required int caseStatus,
    required String employeeId,
  }) : this._internal(
          (ref) => watchEmployeeCaseListByStatusController(
            ref as WatchEmployeeCaseListByStatusControllerRef,
            caseStatus: caseStatus,
            employeeId: employeeId,
          ),
          from: watchEmployeeCaseListByStatusControllerProvider,
          name: r'watchEmployeeCaseListByStatusControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEmployeeCaseListByStatusControllerHash,
          dependencies:
              WatchEmployeeCaseListByStatusControllerFamily._dependencies,
          allTransitiveDependencies:
              WatchEmployeeCaseListByStatusControllerFamily
                  ._allTransitiveDependencies,
          caseStatus: caseStatus,
          employeeId: employeeId,
        );

  WatchEmployeeCaseListByStatusControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.caseStatus,
    required this.employeeId,
  }) : super.internal();

  final int caseStatus;
  final String employeeId;

  @override
  Override overrideWith(
    Stream<List<Case>> Function(
            WatchEmployeeCaseListByStatusControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEmployeeCaseListByStatusControllerProvider._internal(
        (ref) => create(ref as WatchEmployeeCaseListByStatusControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        caseStatus: caseStatus,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Case>> createElement() {
    return _WatchEmployeeCaseListByStatusControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEmployeeCaseListByStatusControllerProvider &&
        other.caseStatus == caseStatus &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, caseStatus.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchEmployeeCaseListByStatusControllerRef
    on AutoDisposeStreamProviderRef<List<Case>> {
  /// The parameter `caseStatus` of this provider.
  int get caseStatus;

  /// The parameter `employeeId` of this provider.
  String get employeeId;
}

class _WatchEmployeeCaseListByStatusControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<Case>>
    with WatchEmployeeCaseListByStatusControllerRef {
  _WatchEmployeeCaseListByStatusControllerProviderElement(super.provider);

  @override
  int get caseStatus =>
      (origin as WatchEmployeeCaseListByStatusControllerProvider).caseStatus;
  @override
  String get employeeId =>
      (origin as WatchEmployeeCaseListByStatusControllerProvider).employeeId;
}

String _$watchEmployeeCaseListOfActiveStatusControllerHash() =>
    r'49012166432b76620cb068508441b4a6ca1d32e2';

/// See also [watchEmployeeCaseListOfActiveStatusController].
@ProviderFor(watchEmployeeCaseListOfActiveStatusController)
const watchEmployeeCaseListOfActiveStatusControllerProvider =
    WatchEmployeeCaseListOfActiveStatusControllerFamily();

/// See also [watchEmployeeCaseListOfActiveStatusController].
class WatchEmployeeCaseListOfActiveStatusControllerFamily
    extends Family<AsyncValue<List<Case>>> {
  /// See also [watchEmployeeCaseListOfActiveStatusController].
  const WatchEmployeeCaseListOfActiveStatusControllerFamily();

  /// See also [watchEmployeeCaseListOfActiveStatusController].
  WatchEmployeeCaseListOfActiveStatusControllerProvider call({
    required String employeeId,
  }) {
    return WatchEmployeeCaseListOfActiveStatusControllerProvider(
      employeeId: employeeId,
    );
  }

  @override
  WatchEmployeeCaseListOfActiveStatusControllerProvider getProviderOverride(
    covariant WatchEmployeeCaseListOfActiveStatusControllerProvider provider,
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
  String? get name => r'watchEmployeeCaseListOfActiveStatusControllerProvider';
}

/// See also [watchEmployeeCaseListOfActiveStatusController].
class WatchEmployeeCaseListOfActiveStatusControllerProvider
    extends AutoDisposeStreamProvider<List<Case>> {
  /// See also [watchEmployeeCaseListOfActiveStatusController].
  WatchEmployeeCaseListOfActiveStatusControllerProvider({
    required String employeeId,
  }) : this._internal(
          (ref) => watchEmployeeCaseListOfActiveStatusController(
            ref as WatchEmployeeCaseListOfActiveStatusControllerRef,
            employeeId: employeeId,
          ),
          from: watchEmployeeCaseListOfActiveStatusControllerProvider,
          name: r'watchEmployeeCaseListOfActiveStatusControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchEmployeeCaseListOfActiveStatusControllerHash,
          dependencies:
              WatchEmployeeCaseListOfActiveStatusControllerFamily._dependencies,
          allTransitiveDependencies:
              WatchEmployeeCaseListOfActiveStatusControllerFamily
                  ._allTransitiveDependencies,
          employeeId: employeeId,
        );

  WatchEmployeeCaseListOfActiveStatusControllerProvider._internal(
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
    Stream<List<Case>> Function(
            WatchEmployeeCaseListOfActiveStatusControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchEmployeeCaseListOfActiveStatusControllerProvider._internal(
        (ref) =>
            create(ref as WatchEmployeeCaseListOfActiveStatusControllerRef),
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
  AutoDisposeStreamProviderElement<List<Case>> createElement() {
    return _WatchEmployeeCaseListOfActiveStatusControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchEmployeeCaseListOfActiveStatusControllerProvider &&
        other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchEmployeeCaseListOfActiveStatusControllerRef
    on AutoDisposeStreamProviderRef<List<Case>> {
  /// The parameter `employeeId` of this provider.
  String get employeeId;
}

class _WatchEmployeeCaseListOfActiveStatusControllerProviderElement
    extends AutoDisposeStreamProviderElement<List<Case>>
    with WatchEmployeeCaseListOfActiveStatusControllerRef {
  _WatchEmployeeCaseListOfActiveStatusControllerProviderElement(super.provider);

  @override
  String get employeeId =>
      (origin as WatchEmployeeCaseListOfActiveStatusControllerProvider)
          .employeeId;
}

String _$caseControllerHash() => r'27e354ac551a43768543b01aa1d3007d6826689e';

/// See also [CaseController].
@ProviderFor(CaseController)
final caseControllerProvider =
    AutoDisposeNotifierProvider<CaseController, AsyncValue>.internal(
  CaseController.new,
  name: r'caseControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$caseControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CaseController = AutoDisposeNotifier<AsyncValue>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
