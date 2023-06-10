import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';

class BackButtton extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback? onTap;
  const BackButtton({
    super.key, required this.icon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(6.w),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            5.w,
          ),
          child:  Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
