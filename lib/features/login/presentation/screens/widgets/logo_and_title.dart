import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nano_health/core/assets/assets.dart';

class LogoTitle extends StatelessWidget {
  const LogoTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            CustomColors.secondary,
            CustomColors.primary,
          ],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SvgPicture.asset(
              CustomIcons.loginLogo,
              fit: BoxFit.none,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 30.w,
              bottom: 20.h,
            ),
            child: Text(
              'Log In',
              style: CustomTypography.titleWhite,
            ),
          ),
        ],
      ),
    );
  }
}
