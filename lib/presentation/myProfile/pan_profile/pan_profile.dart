import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/controller/pan_profile_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customTextField.dart';

class PanProfileSceen extends GetWidget<PanProfileController> {
  const PanProfileSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(child: Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _tdsCertificate(),
              controller.isEditing.value
                  ? profileData(context)
                  : _editData(context),
              SizedBox(
                height: 20.h,
              ),
              _submitbuttons(context)
            ],
          ),
        ),
      );
    }));
  }

  Widget profileData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textData(),
        SizedBox(
          height: 15.h,
        ),
        _profileType(),
        SizedBox(
          height: 10.h,
        ),
        _cardnumber(),
        SizedBox(
          height: 10.h,
        ),
        _cardName(),
        SizedBox(
          height: 10.h,
        ),
        _cardDocument(),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }

  Widget _tdsCertificate() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.mytdscertificate);
      },
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: appTheme.grey500,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'TDS Certificates',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 25,
              color: appTheme.greydownarrow,
            )
          ],
        ),
      ),
    );
  }

  Widget _textData() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pan Profile​(IN) Details',
            style: TextStyle(
              color: appTheme.cyan800,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Status: ',
              style: TextStyle(
                color: appTheme.cyan800,
                fontWeight: FontWeight.normal,
                fontSize: 14,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              children: const [
                TextSpan(
                  text: 'Rejected',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileType() {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 60.h,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: appTheme.grey500,
              width: 1.0,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Pan Card Profile type',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Self',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600),
              ),
            ],
          )),
    );
  }

  Widget _cardnumber() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: appTheme.grey500,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PAN Card Number',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.greytextcolour),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  '23452357890',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.black600),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                  size: 20,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Approved',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.green,
                      fontStyle: FontStyle.italic),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _cardName() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: appTheme.grey500,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Name on the PAN Card',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.greytextcolour),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Chetana Viraj Shelar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.black600),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                  size: 20,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Approved',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.green,
                      fontStyle: FontStyle.italic),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _cardDocument() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: appTheme.grey500,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload PAN Card Copy',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.greytextcolour),
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'View Document',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.blue50),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 20,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Rejected',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: Colors.red,
                      fontStyle: FontStyle.italic),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _submitbuttons(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.white),
                foregroundColor:
                    MaterialStateProperty.all<Color>(appTheme.black600),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: appTheme.greydownarrow,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: appTheme.grey500)),
                ),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: appTheme.greydownarrow),
              ),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {
                controller.isEditing.value = false;
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.redappbar),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              child: Text(controller.isEditing.value ? 'Edit' : 'Submit'),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }

  Widget _editData(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Container(
        color: appTheme.white,
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pan Profile​(IN) Details',
                  style: TextStyle(
                    color: appTheme.cyan800,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: 'Status: ',
                      style: TextStyle(
                        color: appTheme.cyan800,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      children: const [
                        TextSpan(
                          text: ' Not Submitted',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            _toggleData(),
            SizedBox(
              height: 25.h,
            ),
            CustomTextField(
              labelText: 'PAN Card Number',
              controller: controller.holderNamecontroller,
              hintText: '',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              labelText: 'Name on the PAN Card',
              controller: controller.accountnumbercontroller,
              hintText: '',
            ),
            SizedBox(
              height: 20.h,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: 'Upload PAN Card Copy',
                style: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  color: appTheme.redappbar,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ])),
            SizedBox(
              height: 10.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: appTheme.grey500,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: TextField(
                      controller: controller.singlefilecontroller,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 5.0),
                        hintText: 'No file chosen',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return dialoguebox(context);
                          },
                        );
                      },
                      child: Container(
                        width: 100,
                        height: 48,
                        decoration: BoxDecoration(
                            color: const Color(0XFFE41C39),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Center(
                          child: Text(
                            'Choose File',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 250,
              child: Text(
                'Attachment should be of .pdf, .png, .jpg, .jpeg file formats Maxmimum size limit : 5MB',
                style: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 9,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _toggleData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pan Card Profile type',
          style: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        const SizedBox(height: 7),
        Row(
          children: [
            Row(
              children: [
                Obx(() => Radio<String>(
                      value: 'Self',
                      groupValue: controller.selectedProfileType.value,
                      onChanged: (value) {
                        controller.selectedProfileType.value = value!;
                      },
                    )),
                const SizedBox(width: 4),
                Text(
                  'Self',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 30,
            ),
            Row(
              children: [
                Obx(() => Radio<String>(
                      value: 'Business',
                      groupValue: controller.selectedProfileType.value,
                      onChanged: (value) {
                        controller.selectedProfileType.value = value!;
                      },
                    )),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Business',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget dialoguebox(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 199,
        decoration: BoxDecoration(
          color: appTheme.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: appTheme.rediconbackground,
                toolbarHeight: 40,
                automaticallyImplyLeading: false,
                title: const Text(
                  'Select Image',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12, right: 12.5, bottom: 12),
                    child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          color: appTheme.white,
                          Icons.close,
                          size: 18,
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 78.h,
              left: 50.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.chooseFile();
                          Get.back();
                        },
                        child: Image.asset(
                          'assetes/images/gallery.png',
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14.sp,
                            color: appTheme.black600),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.chooseFileCamera();
                          Get.back();
                        },
                        child: Image.asset(
                          'assetes/images/camera.png',
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14.sp,
                            color: appTheme.black600),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
