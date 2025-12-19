import 'dart:async';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:project_crew/core/util/dialog_util.dart';
import 'package:project_crew/presentation/screen/main/feature/home/provider/home_provider.dart';
import 'package:project_crew/presentation/screen/main/feature/home/provider/home_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, this.openAccountTab, this.setBottomNavVisible, this.initialCenter});

  final VoidCallback? openAccountTab;
  final ValueChanged<bool>? setBottomNavVisible;
  final Offset? initialCenter;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _didHideInitialLoading = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(homeProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(homeProvider);
    ref.listen<HomeState>(homeProvider, (prev, state) {
      if (prev?.modal.showLoading != state.modal.showLoading) {
        Future.microtask(() {
          if (!context.mounted) return;
          if (state.modal.showLoading) {
            DialogUtil().showLoading(context: context);
          } else {
            DialogUtil().hideLoading(context: context);
          }
        });
      }
    });

    return Scaffold(
      body: Builder(
        builder: (context) {
          if (_didHideInitialLoading == false) {
            _didHideInitialLoading = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              DialogUtil().hideLoading(context: context);
            });
          }
          return SafeArea(child: Container());
        },
      ),
      floatingActionButton: null,
    );
  }
}
