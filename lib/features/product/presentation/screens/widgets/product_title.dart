import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            30.w,
          ),
          bottomLeft: Radius.circular(
            30.w,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 60.h,
          bottom: 20.h,
        ),
        child: Text(
          'All Products',
          textAlign: TextAlign.center,
          style: CustomTypography.titleNavyBlue,
        ),
      ),
    );
  }
}
