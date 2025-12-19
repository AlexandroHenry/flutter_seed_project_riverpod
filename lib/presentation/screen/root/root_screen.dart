import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_crew/core/helper/context_helper.dart';

class RootScreen extends ConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ContextHelper.currentContext = context;
    return PopScope(
      canPop: false,
      child: HeroControllerScope(
        controller: HeroController(),
        child: const SizedBox.shrink(),
      ),
    );
  }
}
