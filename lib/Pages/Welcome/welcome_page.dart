import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';
import 'package:ulearning/Pages/Welcome/bloc/welcome_event.dart';
import 'package:ulearning/Pages/Welcome/bloc/welcome_state.dart';
import 'package:ulearning/common/Value/colors.dart';
import 'package:ulearning/common/Value/constant.dart';

import '../../common/Routes/names.dart';
import '../../global/global.dart';
import 'bloc/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

  Widget _buildPage(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.only(top: 36.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          'next'.tr(context),
                          'onboardingTitle1'.tr(context),
                          'onboardingDes1'.tr(context),
                          'assets/images/reading.png'),
                      _page(
                          2,
                          context,
                          'next'.tr(context),
                          'onboardingTitle2'.tr(context),
                          'onboardingDes2'.tr(context),
                          'assets/images/boy.png'),
                      _page(
                          3,
                          context,
                          'get_started'.tr(context),
                          'onboardingTitle3'.tr(context),
                          'onboardingDes3'.tr(context),
                          'assets/images/man.png'),
                    ],
                  ),
                  Positioned(
                      bottom: 90.h,
                      child: DotsIndicator(
                          position: state.page.toInt(),
                          dotsCount: 3,
                          mainAxisAlignment: MainAxisAlignment.center,
                          decorator: DotsDecorator(
                              color: AppColors.primaryThirdElementText,
                              activeColor: AppColors.primaryElement,
                              size: const Size.square(8.0),
                              activeSize: const Size(18, 8.0),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )))),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(int index, BuildContext context, String btnName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 20.w),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                height: 1.5.sp,
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            //within 0-2 index
            if (index < 3) {
              //animation
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            } else {
              Global.storageService
                  .setBool(AppConstant.STORAGE_DEVICE_FIRSTE_OPEN, true);
              print('value is ${Global.storageService.getDeviceFirstOpen()}');
              //jump to next page
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.SING_IN,
                (route) => false,
              );
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(top: 90.h, left: 25.w, right: 25.w),
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1))
                ]),
            child: Center(
              child: Text(
                btnName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
