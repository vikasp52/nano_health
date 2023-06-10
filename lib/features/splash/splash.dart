import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health/core/assets/assets.dart';
import 'package:nano_health/core/routing/routing.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () {
        RouteGenerator.pushReplacement(
          routeName: RouteGenerator.loginRoute,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColors.primary,
      child: Center(
        child: SvgPicture.asset(
          CustomIcons.loginLogo,
          fit: BoxFit.none,
        ),
      ),
    );
  }
}
