// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_edit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserEdit)
const userEditProvider = UserEditProvider._();

final class UserEditProvider
    extends $NotifierProvider<UserEdit, UserEditState> {
  const UserEditProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userEditProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userEditHash();

  @$internal
  @override
  UserEdit create() => UserEdit();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserEditState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserEditState>(value),
    );
  }
}

String _$userEditHash() => r'8f38c11e91e75268cf2412c1cbb8a30e896fca1e';

abstract class _$UserEdit extends $Notifier<UserEditState> {
  UserEditState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserEditState, UserEditState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserEditState, UserEditState>,
              UserEditState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
