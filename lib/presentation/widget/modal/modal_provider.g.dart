// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modal_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Modal)
const modalProvider = ModalProvider._();

final class ModalProvider extends $NotifierProvider<Modal, ModalEntity> {
  const ModalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modalProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modalHash();

  @$internal
  @override
  Modal create() => Modal();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModalEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModalEntity>(value),
    );
  }
}

String _$modalHash() => r'49c90d551b7d53ed1d581ec0adc199d79ae01738';

abstract class _$Modal extends $Notifier<ModalEntity> {
  ModalEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ModalEntity, ModalEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModalEntity, ModalEntity>,
              ModalEntity,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
