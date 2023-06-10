import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nano_health/features/product/data/data_source/product_data_source.dart';
import 'package:nano_health/features/product/data/model/model.dart';

class ProductRepository {
  final ProductDataSource _productDataSource;
  ProductRepository(
    ProductDataSource productDataSource,
  ) : _productDataSource = productDataSource;

  Future<Either<String, List<Product>>> getProductList() async {
    try {
      final token = await _productDataSource.getProductList();

      return Right(token);
    } on DioException catch (error) {
      print('error is: $error');
      print('error is: ${error.requestOptions}');
      print('error is: ${error.stackTrace}');
      if (error.response != null) {
        return Left(error.response?.data);
      }
      return const Left('Something went wrong');
    }
  }
}
