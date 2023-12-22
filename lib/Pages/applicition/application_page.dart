import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/applicition/bloc/application_bloc.dart';
import 'package:ulearning/Pages/applicition/bloc/application_event.dart';
import 'package:ulearning/common/Value/colors.dart';

import 'application_widgets.dart';
import 'bloc/application_state.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.w),
                        topRight: Radius.circular(20.w))),
                child: BottomNavigationBar(
                  onTap: (value) {
                    context.read<ApplicationBloc>().add(TriggerAppEvent(value));
                  },
                  currentIndex: state.index,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryFourthElementText,
                  items: bottomTaps(context),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
