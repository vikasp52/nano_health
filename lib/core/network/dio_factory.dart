// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class DioFactory {
  final String baseUrl;

  DioFactory({
    required this.baseUrl,
  });

  Dio create() => Dio(_createBaseOptions());

  BaseOptions _createBaseOptions() => BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: const Duration(minutes: 2),
        connectTimeout: const Duration(minutes: 2),
        headers: {'Content-Type': 'application/json'},
        maxRedirects: 2,
      );
}
