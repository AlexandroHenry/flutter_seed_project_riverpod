// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserDetail)
const userDetailProvider = UserDetailProvider._();

final class UserDetailProvider
    extends $NotifierProvider<UserDetail, UserDetailState> {
  const UserDetailProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userDetailProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userDetailHash();

  @$internal
  @override
  UserDetail create() => UserDetail();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserDetailState>(value),
    );
  }
}

String _$userDetailHash() => r'9196e1a6bb3197ceae73263bb46ca098b3165f7a';

abstract class _$UserDetail extends $Notifier<UserDetailState> {
  UserDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserDetailState, UserDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserDetailState, UserDetailState>,
              UserDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
