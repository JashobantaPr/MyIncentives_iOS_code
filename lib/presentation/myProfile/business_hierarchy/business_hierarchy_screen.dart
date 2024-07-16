import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myProfile/business_hierarchy/controller/business_hieararchy_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class BusinessHierarchyScreen extends GetWidget<BusinessHierarchyController> {
  const BusinessHierarchyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appTheme.rediconbackground));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Container(
            width: 385,
            color: appTheme.grey500,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildRow('Sr No.', 'Hierarchy', isHeader: true),
                  const SizedBox(height: 5),
                  buildRow('1', 'India>Maharashtra'),
                  const SizedBox(height: 5),
                  buildRow('2', 'India>Maharashtra>Navi Mumbai'),
                  const SizedBox(height: 5),
                  buildRow('3', 'India>Maharashtra>Navi Mumbai> Delhi'),
                  const SizedBox(height: 5),
                  buildRow('4', 'India>Maharashtra> Mumbai'),
                  const SizedBox(height: 5),
                  buildRow('5', 'India>Maharashtra>Navi Mumbai> Belapur'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      backgroundColor: appTheme.redappbar,
      automaticallyImplyLeading: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Business Hierarchy',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: appTheme.white,
          ),
        ),
      ),
    );
  }

  Widget buildRow(String serial, String hierarchy, {bool isHeader = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildContainer(serial, isHeader),
        const SizedBox(width: 5),
        buildContainer(hierarchy, isHeader, width: 269),
      ],
    );
  }

  Widget buildContainer(String text, bool isHeader, {double width = 60}) {
    return Container(
      width: width,
      height: 48,
      color: Colors.white,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isHeader ? Colors.black : appTheme.black600,
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
