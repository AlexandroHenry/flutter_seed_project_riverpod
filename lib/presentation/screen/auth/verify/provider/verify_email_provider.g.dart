// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VerifyEmail)
const verifyEmailProvider = VerifyEmailProvider._();

final class VerifyEmailProvider
    extends $NotifierProvider<VerifyEmail, VerifyEmailState> {
  const VerifyEmailProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifyEmailProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifyEmailHash();

  @$internal
  @override
  VerifyEmail create() => VerifyEmail();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VerifyEmailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VerifyEmailState>(value),
    );
  }
}

String _$verifyEmailHash() => r'ed318f1ca6341307d8bc074c16c5d21444a49c7c';

abstract class _$VerifyEmail extends $Notifier<VerifyEmailState> {
  VerifyEmailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<VerifyEmailState, VerifyEmailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VerifyEmailState, VerifyEmailState>,
              VerifyEmailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
