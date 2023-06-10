// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nano_health/features/product/data/model/model.dart';
import 'package:nano_health/features/product/data/repository/product_repository.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepository)
      : super(
          const ProductState.loading(),
        ) {
    getProducts();
  }

  final ProductRepository productRepository;

  Future<void> getProducts() async {
    emit(const ProductState.loading());

    final validate = await productRepository.getProductList();

    validate.fold(
      (l) => emit(ProductState.error(
        l,
      )),
      (r) async {
        emit(ProductState.productLoaded(r));
      },
    );
  }
}
