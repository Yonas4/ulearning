import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';
import 'package:ulearning/common/Routes/names.dart';
import 'package:ulearning/common/Value/colors.dart';

import '../../../common/Widgets/base_text_widget.dart';

//build app bar
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset(
              'assets/icons/menu.png',
            )),
        reusableText(
          'profile'.tr(context),
        ),
        SizedBox(
          width: 24.w,
          height: 24.h,
          child: Image.asset('assets/icons/more-vertical.png'),
        )
      ],
    ),
  );
}

// build profile Icon And Edit Button
Widget profileIconAndEditButton() {
  return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(right: 5.w, left: 5.w, bottom: 3.h),
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.w),
          image: const DecorationImage(
              image: AssetImage('assets/icons/headpic.png'))),
      child: Image(
        width: 25.w,
        height: 25.h,
        image: const AssetImage('assets/icons/edit_3.png'),
      ));
}

//build setting section

var imageInfo = <String, String>{
  "setting": "settings.png",
  "payment_det": "credit-card.png",
  "achievement": "award.png",
  "favorite": "heart(1).png",
  "reminders": "cube.png",
};

Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(imageInfo.length, (int index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, AppRoutes.SETTING),
          child: Container(
            margin: EdgeInsets.only(bottom: 15.h),
            child: Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: EdgeInsets.all(7.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColors.primaryElement),
                  child: Image.asset(
                      'assets/icons/${imageInfo.values.elementAt(index)}'),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(
                  imageInfo.keys.elementAt(index).tr(context),
                  style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                )
              ],
            ),
          ),
        );
      })
    ],
  );
}
