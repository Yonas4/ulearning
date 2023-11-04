import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/Value/colors.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('setting');
        },
        child: const Icon(Icons.settings),
      )
    ],
    centerTitle: true,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        height: 1.0,
      ),
    ),
    title: Text(
      'Log In',
      style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 15.sp,
          fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 40.h),
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        reusableIcons('google'),
        reusableIcons('apple'),
        reusableIcons('facebook'),
      ],
    ),
  );
}

Widget reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
          color: Colors.grey.withOpacity(0.5),
          fontWeight: FontWeight.normal,
          fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hint, String textType, String iconName) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
        border: Border.all(color: AppColors.primaryFourthElementText)),
    child: Row(
      children: [
        Container(
          width: 16.w,
          margin: EdgeInsets.only(left: 17.w, right: 17.w),
          height: 16.w,
          child: Image.asset('assets/icons/$iconName.png'),
        ),
        Expanded(
            child: SizedBox(
          child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hint,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                helperStyle: const TextStyle(
                    color: AppColors.primarySecondaryElementText)),
            style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Avenir',
                fontSize: 14.sp),
            autocorrect: false,
            obscureText: textType == 'password' ? true : false,
          ),
        ))
      ],
    ),
  );
}

Widget forgotPassword(String text) {
  return SizedBox(
    width: 260.w,
    height: 40.h,
    child: Text(
      text,
      style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp),
    ),
  );
}

Widget buildLoginRegButton(String buttonName, String type) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(top: 20.h),
      alignment: Alignment.center,
      width: 350.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: type == 'login'
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.w),
          border: Border.all(
              color: type == 'login'
                  ? Colors.transparent
                  : AppColors.primaryFourthElementText),
          boxShadow: [
            BoxShadow(
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
                color: Colors.grey.withOpacity(0.1))
          ]),
      child: Text(
        buttonName,
        style: TextStyle(
            color: type == 'login'
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    ),
  );
}
