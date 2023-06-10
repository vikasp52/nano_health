import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nano_health/core/network/network.dart';
import 'package:nano_health/features/login/data/data_source/login_data_source.dart';
import 'package:nano_health/features/product/data/data_source/product_data_source.dart';
import 'package:nano_health/features/product/data/repository/product_repository.dart';

import '../../features/login/data/repository/login_repository.dart';

final serviceLocator = GetIt.I;
Future<void> setUp(String baseUrl) async {
  serviceLocator.registerLazySingleton<Dio>(() => _createDio(baseUrl));

  serviceLocator.registerLazySingleton<LoginRepository>(
    () => LoginRepository(
      LoginDataSource(
        serviceLocator<Dio>(),
      ),
    ),
  );

  serviceLocator.registerLazySingleton<ProductRepository>(
    () => ProductRepository(
      ProductDataSource(
        serviceLocator<Dio>(),
      ),
    ),
  );
}

Dio _createDio(String baseUrl) {
  final dioFactory = DioFactory(
    baseUrl: baseUrl,
  );

  return dioFactory.create();
}
