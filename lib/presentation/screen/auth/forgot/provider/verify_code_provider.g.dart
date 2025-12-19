// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VerifyCode)
const verifyCodeProvider = VerifyCodeProvider._();

final class VerifyCodeProvider
    extends $NotifierProvider<VerifyCode, VerifyCodeState> {
  const VerifyCodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifyCodeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifyCodeHash();

  @$internal
  @override
  VerifyCode create() => VerifyCode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VerifyCodeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VerifyCodeState>(value),
    );
  }
}

String _$verifyCodeHash() => r'4c9f396721f5c419a5b265394a20a71ebc7f8bc9';

abstract class _$VerifyCode extends $Notifier<VerifyCodeState> {
  VerifyCodeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<VerifyCodeState, VerifyCodeState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<VerifyCodeState, VerifyCodeState>,
              VerifyCodeState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
