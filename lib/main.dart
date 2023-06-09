import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';
import 'package:nano_health/core/routing/routing.dart';
import 'package:nano_health/features/login/presentation/screens/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) => MaterialApp(
        home: child,
        theme: lightTheme,
        navigatorKey: RouteGenerator.navigatorKey,
        initialRoute: RouteGenerator.initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
      child: const Login(),
    );
  }
}