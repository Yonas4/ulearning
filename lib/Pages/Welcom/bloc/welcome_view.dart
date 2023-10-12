import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'welcome_bloc.dart';
import 'welcome_event.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => WelcomeBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<WelcomeBloc>(context);

    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            children: [
              PageView(
                children: [
                  _page(1, context, 'Next', 'First See Learning',
                      'testtesttesttesttesttesttesttesttesttesttesttest', 'k'),
                  _page(1, context, 'Next', 'First See Learning',
                      'testtesttesttesttesttesttesttesttesttesttesttest', 'k'),
                  _page(1, context, 'Get Started', 'First See Learning',
                      'testtesttesttesttesttesttesttesttesttesttesttest', 'k'),
                ],
              )
            ],
          ),
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
          child: Text('data'),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          width: 325.w,
          height: 50.h,
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          decoration: BoxDecoration(
              color: Colors.blue,
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
      ],
    );
  }
}
