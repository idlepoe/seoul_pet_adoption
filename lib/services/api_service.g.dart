// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiServiceHash() => r'ce72c4f572ea14a273b01086cdc8905a2e469468';

/// See also [apiService].
@ProviderFor(apiService)
final apiServiceProvider = AutoDisposeProvider<ApiService>.internal(
  apiService,
  name: r'apiServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ApiServiceRef = AutoDisposeProviderRef<ApiService>;
String _$animalsHash() => r'2922762b5e9246d5735b04846a19dff6e0c4bb56';

/// See also [animals].
@ProviderFor(animals)
final animalsProvider = AutoDisposeFutureProvider<List<Animal>>.internal(
  animals,
  name: r'animalsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$animalsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AnimalsRef = AutoDisposeFutureProviderRef<List<Animal>>;
String _$animalDetailHash() => r'f0f877beeb90448128f41200a64bc65c9080b179';

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

/// See also [animalDetail].
@ProviderFor(animalDetail)
const animalDetailProvider = AnimalDetailFamily();

/// See also [animalDetail].
class AnimalDetailFamily extends Family<AsyncValue<Animal>> {
  /// See also [animalDetail].
  const AnimalDetailFamily();

  /// See also [animalDetail].
  AnimalDetailProvider call(
    int id,
  ) {
    return AnimalDetailProvider(
      id,
    );
  }

  @override
  AnimalDetailProvider getProviderOverride(
    covariant AnimalDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'animalDetailProvider';
}

/// See also [animalDetail].
class AnimalDetailProvider extends AutoDisposeFutureProvider<Animal> {
  /// See also [animalDetail].
  AnimalDetailProvider(
    int id,
  ) : this._internal(
          (ref) => animalDetail(
            ref as AnimalDetailRef,
            id,
          ),
          from: animalDetailProvider,
          name: r'animalDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$animalDetailHash,
          dependencies: AnimalDetailFamily._dependencies,
          allTransitiveDependencies:
              AnimalDetailFamily._allTransitiveDependencies,
          id: id,
        );

  AnimalDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Animal> Function(AnimalDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AnimalDetailProvider._internal(
        (ref) => create(ref as AnimalDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Animal> createElement() {
    return _AnimalDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AnimalDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AnimalDetailRef on AutoDisposeFutureProviderRef<Animal> {
  /// The parameter `id` of this provider.
  int get id;
}

class _AnimalDetailProviderElement
    extends AutoDisposeFutureProviderElement<Animal> with AnimalDetailRef {
  _AnimalDetailProviderElement(super.provider);

  @override
  int get id => (origin as AnimalDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
