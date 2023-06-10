import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';
import 'package:nano_health/core/routing/routing.dart';
import 'package:nano_health/features/product/presentation/cubit/product_cubit.dart';
import 'package:nano_health/features/product/presentation/screens/widgets/widgets.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const ProductTitle(),
          Expanded(
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  error: (message) => Center(
                    child: Text(
                      message,
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                  productLoaded: (productList) => ListView.builder(
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      final product = productList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                        ),
                        child: InkWell(
                          onTap: () => RouteGenerator.pushName(
                            routeName: RouteGenerator.productDetailsRoute,
                            argument: product,
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Image.network(
                                    product.image ?? 'No image',
                                    height: 200,
                                    width: double.maxFinite,
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 10.w,
                                        bottom: 10.h,
                                      ),
                                      child: Text(
                                        '${product.price ?? ''} AED',
                                        style:
                                            CustomTypography.productPriceWhite,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right: 10.w,
                                        bottom: 10.h,
                                      ),
                                      child: RatingBarIndicator(
                                        rating: product.rating?.rate ?? 0.0,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: CustomColors.yellow,
                                        ),
                                        unratedColor: CustomColors.monsoon,
                                        itemCount: 5,
                                        itemSize: 30.w,
                                        direction: Axis.horizontal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              ListTile(
                                title: Text(
                                  product.title ?? '',
                                  style: CustomTypography.contentDetails,
                                ),
                                subtitle: Text(
                                  product.description ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTypography.contentNavyBlue,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 10.h,
                                ),
                                child: const Divider(
                                  color: CustomColors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
