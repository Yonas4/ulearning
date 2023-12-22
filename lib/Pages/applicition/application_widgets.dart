import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/HomePage/home_page.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';

import '../../common/Value/colors.dart';
import '../Profile/profile_page.dart';

Widget buildPage(int index) {
  List<Widget> widgets = [
    const HomePage(),
    const Center(
      child: Text('saercch'),
    ),
    const Center(
      child: Text('3'),
    ),
    const Center(
      child: Text('4'),
    ),
   const ProfilePage(),
  ];

  return widgets[index];
}

bottomTaps(BuildContext context) {
  return [
    BottomNavigationBarItem(
        label: 'home'.tr(context),
        icon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset('assets/icons/home.png'),
        ),
        activeIcon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset(
            'assets/icons/home.png',
            color: AppColors.primaryElement,
          ),
        )),
    BottomNavigationBarItem(
        label: 'search'.tr(context),
        icon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset('assets/icons/search2.png'),
        ),
        activeIcon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset(
            'assets/icons/search2.png',
            color: AppColors.primaryElement,
          ),
        )),
    BottomNavigationBarItem(
        label: 'course'.tr(context),
        icon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset('assets/icons/play-circle1.png'),
        ),
        activeIcon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset(
            'assets/icons/play-circle1.png',
            color: AppColors.primaryElement,
          ),
        )),
    BottomNavigationBarItem(
        label: 'chat'.tr(context),
        icon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset(
            'assets/icons/message-circle.png',
          ),
        ),
        activeIcon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset(
            'assets/icons/message-circle.png',
            color: AppColors.primaryElement,
          ),
        )),
    BottomNavigationBarItem(
        label: 'profile'.tr(context),
        icon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset('assets/icons/person.png'),
        ),
        activeIcon: SizedBox(
          width: 15.w,
          height: 15.w,
          child: Image.asset(
            'assets/icons/person.png',
            color: AppColors.primaryElement,
          ),
        )),
  ];
}
