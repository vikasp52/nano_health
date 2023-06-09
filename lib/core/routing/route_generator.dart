import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nano_health/core/di/inection_container.dart';
import 'package:nano_health/features/login/data/repository/login_repository.dart';
import 'package:nano_health/features/login/presentation/cubit/login_cubit.dart';
import 'package:nano_health/features/login/presentation/screens/screen.dart';
import 'package:nano_health/features/product/data/model/product.dart';
import 'package:nano_health/features/product/data/repository/product_repository.dart';
import 'package:nano_health/features/product/presentation/cubit/product_cubit.dart';
import 'package:nano_health/features/product/presentation/screens/screen.dart';
import 'package:nano_health/features/splash/splash.dart';

class RouteGenerator {
  static const String initialRoute = '/';
  static const String loginRoute = '/Login';
  static const String productRoute = '/Product';
  static const String productDetailsRoute = '/ProductDetails';
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic>? pushName<Argument>(
      {required String routeName, Argument? argument}) {
    return navigatorKey.currentState?.pushNamed(
      routeName,
      arguments: argument,
    );
  }

  static Future<dynamic>? pushReplacement<Argument>(
      {required String routeName, Argument? argument}) {
    return navigatorKey.currentState?.pushReplacementNamed(
      routeName,
      arguments: argument,
    );
  }

  static Future<dynamic>? pushAndRemoveUntil<Argument>(
      {required String routeName}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    late Widget screen;

    switch (routeSettings.name) {
      case initialRoute:
        screen = const SplashScreen();
        break;
      case loginRoute:
        screen = BlocProvider(
          create: (context) => LoginCubit(
            serviceLocator<LoginRepository>(),
          ),
          child: const Login(),
        );
        break;
      case productRoute:
        screen = BlocProvider(
          create: (context) => ProductCubit(
            serviceLocator<ProductRepository>(),
          ),
          child: const ProductList(),
        );
        break;
      case productDetailsRoute:
        final product = routeSettings.arguments as Product;

        screen = ProductDetails(
          product: product,
        );
        break;
      default:
        screen = const Scaffold(
          body: Center(
            child: Text(
              'Invalid Route',
            ),
          ),
        );
    }

    return MaterialPageRoute(
      builder: (_) => screen,
    );
  }
}
