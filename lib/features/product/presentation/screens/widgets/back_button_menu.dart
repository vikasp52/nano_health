import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nano_health/core/assets/assets.dart';
import 'package:nano_health/features/product/presentation/screens/widgets/widgets.dart';


class BackButtonAndMenu extends StatelessWidget {
  const BackButtonAndMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
