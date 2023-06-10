import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';

SnackBar customSnackBar({bool success = true, required String message}) {
  return SnackBar(
    backgroundColor: success ? CustomColors.primary : CustomColors.error,
    content: Row(
      children: [
        const Icon(
          Icons.info,
          color: CustomColors.white,
        ),
        SizedBox(
          width: 10.w,
        ),
        Flexible(
          child: Text(
            message,
          ),
        ),
      ],
    ),
  );
}
