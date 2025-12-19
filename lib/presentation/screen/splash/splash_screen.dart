import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:project_crew/core/config/colors.dart';
import 'package:get_it/get_it.dart';
import 'package:project_crew/core/shared/internal_storage.dart';
import 'package:project_crew/core/util/jwt_util.dart';
import 'package:project_crew/presentation/router/app_path.dart';
import 'package:project_crew/presentation/widget/bg/gradient_background.dart';
import 'package:project_crew/presentation/widget/button/capsule_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () async {
      if (mounted == false) return;
      // Auto-login check
      final storage = GetIt.instance<InternalStorage>();
      final account = await storage.getToken();
      final hasAccess = account.accessToken.isNotEmpty;
      final isExpired = hasAccess ? await JwtUtil().isTokenExpiry(account.accessToken) : true;
      if (hasAccess && isExpired == false) {
        if (!mounted) return;
        context.go(AppPath.main.fullPath);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          children: [
            Positioned.fill(
              child: GradientBackground(gradient: AppGradients.loginBackground),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Spacer(),
                    CapsuleButton(
                      onTap: () async {
                        HapticFeedback.heavyImpact();
                        // 작은 지연 후 내비게이션 (진동 반영 시간)
                        await Future.delayed(const Duration(milliseconds: 50));
                        if (!mounted) return;
                        context.go(AppPath.login.fullPath);
                      },
                      text: "Let's Start",
                      gaugeDuration: Duration(milliseconds: 1200),
                      enableGauge: true,
                      gaugeGradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.blue,
                          Colors.green,
                          Colors.yellow,
                          Colors.red,
                        ],
                      ),
                      triggerOnFullGauge: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
