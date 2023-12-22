import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './widgets/profile_widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              profileIconAndEditButton(),
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.only(left: 25.0.w, right: 25.w),
                child: buildListView(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
