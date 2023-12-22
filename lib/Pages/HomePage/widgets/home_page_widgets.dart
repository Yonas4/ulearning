import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/HomePage/bloc/home_page_bloc.dart';
import 'package:ulearning/Pages/HomePage/bloc/home_page_event.dart';
import 'package:ulearning/Pages/HomePage/bloc/home_page_state.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';
import 'package:ulearning/common/Value/colors.dart';

import '../../../common/Widgets/base_text_widget.dart';

//build app bar for home screen
AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
              child: Container(
            width: 40.w,
            height: 40.h,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage('assets/icons/person.png')),
            ),
          ))
        ],
      ),
    ),
  );
}

//big home page text
Widget homePageText(String text, BuildContext context,
    {Color? color = AppColors.primaryText, double top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.w),
    child: Text(
      text.tr(context),
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

//search view
Widget searchView(BuildContext context) {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourthElementText)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                    hintText: 'search_bar'.tr(context),
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
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: 5.w,
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(13.w),
              border: Border.all(color: AppColors.primaryElement)),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}

//slider
Widget sliderView(BuildContext context, HomePageState state) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBloc>().add(HomePageDotsEvent(value));
          },
          children: [
            _sliderWidget(imagePath: 'assets/icons/art.png'),
            _sliderWidget(imagePath: 'assets/icons/Image_1.png'),
            _sliderWidget(imagePath: 'assets/icons/Image_2.png'),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      )
    ],
  );
}

//slider widget
Widget _sliderWidget({String imagePath = 'assets/icons/art.png'}) {
  return Container(
    margin: EdgeInsets.only(left: 5.w, right: 5.w),
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.h),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(imagePath),
        )),
  );
}

Widget menuView(BuildContext context) {
  return Column(
    children: [
      Container(
        width: 325,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            reusableText('chose_course'.tr(context)),
            GestureDetector(
                onTap: () {},
                child: reusableText('see_all'.tr(context),
                    color: AppColors.primaryThirdElementText, fontSize: 10)),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.w, left: 5.w),
        child: Row(
          children: [
            _reusableMenuText(context, 'all'),
            _reusableMenuText(context, 'popular',
                textColor: AppColors.primaryThirdElementText,
                backColor: Colors.white),
            _reusableMenuText(context, 'newest',
                textColor: AppColors.primaryThirdElementText,
                backColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

Widget _reusableMenuText(BuildContext context, String menuText,
    {Color textColor = AppColors.primaryElementText,
    Color backColor = AppColors.primaryElement}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 15.w, right: 15.w),
    decoration: BoxDecoration(
      color: backColor,
      borderRadius: BorderRadius.circular(7.w),
    ),
    child: reusableText(menuText.tr(context),
        color: textColor, fontWeight: FontWeight.normal),
  );
}

Widget courseGrid(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage('assets/icons/Image_2.png'))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'onboardingTitle2'.tr(context),
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.start,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryElementText,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'onboardingTitle2'.tr(context),
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.start,
          softWrap: false,
          style: TextStyle(
              color: AppColors.primaryFourthElementText,
              fontWeight: FontWeight.bold,
              fontSize: 8.sp),
        ),
      ],
    ),
  );
}
