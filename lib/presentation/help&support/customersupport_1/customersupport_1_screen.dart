import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/controller/customersupport_1_controller.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CustomerSupport1Screen extends GetWidget<CustomerSupport1Controller> {
  const CustomerSupport1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
          backgroundColor: appTheme.background,
          appBar: _customAppBar(),
          body: Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16.h),
                  pointsData(),
                  SizedBox(height: 15.h),
                  _buildNewTicketButton(context),
                  SizedBox(
                    height: 15.h,
                  ),
                  listData(context)
                ],
              ),
            );
          })),
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
            ImageConstant.arrowback,
            width: 26.75.w,
            height: 19.76.h,
          ),
        ),
      ),
      title: Text(
        'All Modules',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 18.sp,
          color: appTheme.white,
        ),
      ),
    );
  }

  Widget pointsData() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: OptionCard(
                imagePath: ImageConstant.totalTickets,
                points: controller.parsePoints(
                    controller.ticketSummary.value.total.toString()),
                text: 'Total No. of Tickets',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OptionCard(
                imagePath: ImageConstant.openTicket,
                points: controller.parsePoints(
                    controller.ticketSummary.value.open.toString()),
                text: 'Open Tickets',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: OptionCard(
                imagePath: ImageConstant.closeTicket,
                points: controller.parsePoints(
                    controller.ticketSummary.value.closed.toString()),
                text: 'Closed Tickets',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: OptionCard(
                imagePath: ImageConstant.unholdTickets,
                points: controller.parsePoints(
                    controller.ticketSummary.value.onhold.toString()),
                text: 'On Hold Tickets',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNewTicketButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(appTheme.redappbar),
        maximumSize: const MaterialStatePropertyAll(Size(129, 40)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.add,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(width: 8),
          Text(
            'New Ticket',
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 104.w,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Text(':'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                value,
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12.sp,
                  color: appTheme.black600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listData(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Number of items to display
      itemBuilder: (context, index) {
        return Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: appTheme.white,
            shape: BoxShape.rectangle,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _buildDataRow('Ticket Id', 'T000002315')),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(100, 100, 0, 0),
                          items: const [
                            PopupMenuItem<String>(
                              value: 'View Details',
                              child: Text('View Details'),
                            ),
                            PopupMenuItem<String>(
                              value: 'Edit',
                              child: Text('Edit'),
                            ),
                          ],
                        ).then((value) {
                          if (value == 'View Details') {
                            // Handle view details action
                          } else {
                            // Handle other actions
                          }
                        });
                      },
                      child: SvgPicture.asset(
                        ImageConstant.morevert,
                        width: 18.w,
                        height: 18.h,
                      ),
                    ),
                  ),
                ],
              ),
              _buildDataRow('Assignee', 'Chetana Shela'),
              _buildDataRow('Create Date', '8 Mar 2022 5:00 PM'),
              _buildDataRow('Status', 'Open'),
            ],
          ),
        );
      },
    );
  }
}
