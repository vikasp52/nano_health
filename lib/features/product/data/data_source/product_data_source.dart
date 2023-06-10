// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:nano_health/core/network/network.dart';
import 'package:nano_health/features/product/data/model/product.dart';
import 'package:retrofit/retrofit.dart' as retrofit;

part 'product_data_source.g.dart';

@retrofit.RestApi()
abstract class ProductDataSource {
  factory ProductDataSource(Dio dio) = _ProductDataSource;

  @retrofit.GET(NetworkConstants.productList)
  Future<List<Product>> getProductList();
}
