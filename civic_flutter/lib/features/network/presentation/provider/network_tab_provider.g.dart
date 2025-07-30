// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_tab_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$networkTabControllerHash() =>
    r'656cf8b489387da6bf7bd2cdccb38cba9073117a';

/// See also [NetworkTabController].
@ProviderFor(NetworkTabController)
final networkTabControllerProvider = AutoDisposeNotifierProvider<
    NetworkTabController, Raw<TabController>>.internal(
  NetworkTabController.new,
  name: r'networkTabControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkTabControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkTabController = AutoDisposeNotifier<Raw<TabController>>;
String _$networkCurrentPageHash() =>
    r'69455c19b9a7feb4c8082932fc71dd00ff2013a6';

/// See also [NetworkCurrentPage].
@ProviderFor(NetworkCurrentPage)
final networkCurrentPageProvider =
    AutoDisposeNotifierProvider<NetworkCurrentPage, int>.internal(
  NetworkCurrentPage.new,
  name: r'networkCurrentPageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$networkCurrentPageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NetworkCurrentPage = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
