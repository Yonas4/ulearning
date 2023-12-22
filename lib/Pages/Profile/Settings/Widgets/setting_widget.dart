import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning/Pages/Profile/Settings/localization/app_localizations.dart';
import 'package:ulearning/common/Widgets/base_text_widget.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Container(
      child: Container(
        child: reusableText('setting'.tr(context) )
      ),
    ),
  );
}

Widget logOutButton(BuildContext context,void Function()? func){
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('confirm_log_out'.tr(context)),
              content: Text('confirm_log_out_msg'.tr(context)),
              alignment: Alignment.center,
              actionsAlignment: MainAxisAlignment.spaceAround,
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('cancel'.tr(context)),
                ),
                TextButton(
                  onPressed: func,
                  child: Text('confirm'.tr(context)),
                )
              ],
            );
          });
    },
    child: Container(
      height: 100.w,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('assets/icons/Logout.png'))),
      // child: Text('hello'.tr(context)),
    ),
  );
}
