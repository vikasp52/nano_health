import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';
import 'package:nano_health/features/product/presentation/screens/widgets/widgets.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenHeight * 0.7;

    return Material(
      child: Stack(
        children: [
          Image.asset(
            CustomIcons.detailsImage,
            height: imageHeight,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 40.h,
                  left: 10.w,
                  right: 20.w,
                  bottom: 10.h,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BackButtton(
                          icon: Icons.arrow_back,
                          onTap: () => Navigator.pop(context),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        Text(
                          'Details',
                          style: CustomTypography.titleWhite,
                        ),
                      ],
                    ),
                    BackButtton(
                      icon: Icons.more_vert,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          bottom: 5.h,
                        ),
                        child: Text(
                          '0000 AED',
                          style: CustomTypography.ratingTitle,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CustomColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(34.w),
                            topRight: Radius.circular(34.w),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ExpansionTile(
                          trailing: const SizedBox.shrink(),
                          tilePadding: EdgeInsets.zero,
                          title: Column(
                            children: [
                              const Center(
                                child: Icon(
                                  Icons.expand_more,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(12.w),
                                      child: const Icon(
                                        Icons.upload_file,
                                        color: CustomColors.primary,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Order Now',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.w,
                              ),
                              ListTile(
                                title: Text(
                                  'description',
                                  style: CustomTypography.contentDetailsTitle,
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                  ),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                                    style: CustomTypography.contentDetails,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: CustomColors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14.w),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 20.h,
                                  horizontal: 20.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Review (100)',
                                      style: CustomTypography.subTitle,
                                    ),
                                    SizedBox(
                                      height: 10.w,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '4.3',
                                          style: CustomTypography.ratingTitle,
                                        ),
                                        RatingBarIndicator(
                                          rating: 3.5,
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: CustomColors.yellow,
                                          ),
                                          itemCount: 5,
                                          itemSize: 40.w,
                                          direction: Axis.horizontal,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
