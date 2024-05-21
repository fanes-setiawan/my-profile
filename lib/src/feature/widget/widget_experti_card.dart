import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/colors/myColors.dart';
import '../../constant/font/fonts.dart';

Widget buildExpertiseCard(BuildContext context,
    {required String title,
    required String iconPath,
    required String content}) {
  return Container(
    width: MediaQuery.of(context).size.width < 600 ? 0.9.sw : 0.4.sw,
    height: MediaQuery.of(context).size.width < 600 ? 200.h : 400.h,
    decoration: BoxDecoration(
      border: Border.all(
        color: MyColors().white,
        width: 1.0.w,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              color: MyColors().white,
              height: MediaQuery.of(context).size.width < 600 ? 25.h : 50.h,
            ),
            SizedBox(width: 10.w),
            tittletext(
              title: title,
              fontSize: MediaQuery.of(context).size.width < 600 ? 18.sp : 18.sp,
            ),
          ],
        ),
        SizedBox(height: 10.h),
        datetext(
          title: content,
          fontSize: MediaQuery.of(context).size.width < 600 ? 10.sp : 5.sp,
        ),
      ],
    ),
  );
}
