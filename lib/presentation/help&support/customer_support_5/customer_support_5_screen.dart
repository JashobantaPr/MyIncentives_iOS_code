import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_5/controller/customer_support_5_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class HelpandSupportCustomerSupport5Screen
    extends GetWidget<HelpandSupportCustomerSupport5Controller> {
  const HelpandSupportCustomerSupport5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: appTheme.white,
        appBar: AppBar(
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 26.75.w,
              height: 19.76.h,
            ),
          ),
          title: Text(
            'View Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 23),
          color: const Color(0xFFF0F0F0), // Background color for the body
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                _buildHelpAndSupport(),
                SizedBox(height: 10),
                _buildViewDetails(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Divider(
                    color: appTheme.gray500,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHelpAndSupport() {
    return Container(
      width: 340,
      height: 198,
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ticket Details',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          SizedBox(height: 8),
          _buildTicketDetails('Ticket Id', ':', 'T000002315'),
          _buildTicketDetails('Request Name', ':', 'Chetana Shelar'),
          _buildTicketDetails('Category', ':', 'Redemption/Orders'),
          _buildTicketDetails('Assignee', ':', 'Support Team'),
          _buildTicketDetails('Create Date', ':', '8 Mar 2022 5:00 PM'),
          _buildTicketDetails('Status', ':', 'Open'),
        ],
      ),
    );
  }

  Widget _buildTicketDetails(String label1, String separator, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: Text(
                label1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              separator,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600,
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Text(
                label2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 7.0),
      ],
    );
  }

  Widget _buildViewDetails() {
    return Container(
      width: double.maxFinite,
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Wanted to create an acount in yoy system, help me!',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              'Chetana Shelar',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            SizedBox(width: 2),
            Text(
              '<chetana.shelar@grgindia.in>',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: appTheme.blue50,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          '8 Mar 2022 5:00 Pm',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: appTheme.black900,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items at the top
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: appTheme.rediconbackground,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(
                  ImageConstant.birthdays,
                ),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chetana Shelar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Hi Support team, I have an issue. I have to create an account in your system, but I can see that one of the required fields is business email. I am working as a slow entrepreneur and using my Gmail box communications, will it suit? Or should I have some dedicated business domain? \nPlease let me know. \nBy the way, my country has also been determined wrong.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: appTheme.greytextcolour,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 65.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: appTheme.rediconbackground,
                    width: 1,
                  ),
                ),
                child: Image.asset(
                  ImageConstant.birthdays,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 100,
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: appTheme.rediconbackground,
                    width: 1,
                  ),
                ),
                child: Image.asset(
                  ImageConstant.birthdays,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
        Divider(
          color: appTheme.gray500,
          thickness: 1.0,
        ),
        SizedBox(height: 25),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: appTheme.rediconbackground,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(
                  ImageConstant.birthdays,
                ),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Support Team',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '8 Mar 2022 6:00 PM',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: appTheme.greytextcolour,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'While placing order showing PHP error While placing order showing..',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: appTheme.greytextcolour,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  SizedBox(height: 25),
                  Divider(
                    color: appTheme.gray500,
                    thickness: 1.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
