part of 'product_cubit.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState.loading() = _Loading;
  const factory ProductState.productLoaded(List<Product> productList) = _ProductLoaded;
  const factory ProductState.error(String message) = _Error;
}

