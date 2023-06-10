import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';
import 'package:nano_health/core/routing/routing.dart';
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
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: InkWell(
                    onTap: () => RouteGenerator.pushName(
                      routeName: RouteGenerator.productDetailsRoute,
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.w),
                              child: Image.asset(
                                CustomIcons.testImage,
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 10.w,
                                  bottom: 10.h,
                                ),
                                child: Text(
                                  '00000 AED',
                                  style: CustomTypography.productPriceWhite,
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
                                  rating: 3.5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: CustomColors.yellow,
                                  ),
                                  unratedColor: CustomColors.whiteSmoke,
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
                            'product name',
                            style: CustomTypography.contentDetails,
                          ),
                          subtitle: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna',
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
          ),
        ],
      ),
    );
  }
}
