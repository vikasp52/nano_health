import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';
import 'package:nano_health/core/routing/routing.dart';
import 'package:nano_health/features/product/data/model/product.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
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
  }
}
