import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/controller/bank_ac_profile_controller..dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/widgets/customTextField.dart';

class BankAccountProfileScreen extends GetWidget<BankAccountProfileController> {
  const BankAccountProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Obx(() {
          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  controller.isEditing.value
                      ? profileData(context)
                      : _bankProfiledetails(context),
                  SizedBox(
                    height: 20.h,
                  ),
                  _submitbuttons()
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget _bankProfiledetails(BuildContext context) {
    return Container(
      color: appTheme.white,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bank Profile Details',
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
                      text: 'Draft',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
            labelText: 'Name of the Bank Account Holder',
            controller: controller.holderNamecontroller,
            hintText: '',
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            labelText: 'Bank Account Number',
            controller: controller.accountnumbercontroller,
            hintText: '',
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            labelText: 'Bank Name',
            controller: controller.banknamecontroller,
            hintText: '',
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextField(
            labelText: 'IFSC Code*',
            controller: controller.ifsccontroller,
            hintText: '',
          ),
          SizedBox(
            height: 20.h,
          ),
          _toggleData1(),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 250,
            child: Text(
              'Upload Copy of the Cancelled Cheque OR Passbook(1st page) OR Bank Statement*',
              style: TextStyle(
                color: appTheme.greytextcolour,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
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
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align items to the edges
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

  Widget _toggleData1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'Type of the Account',
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
          )
        ])),
        const SizedBox(height: 7),
        Row(
          children: [
            Row(
              children: [
                Obx(() => Radio<String>(
                      value: 'Current',
                      groupValue: controller.selectedAccountType.value,
                      onChanged: (value) {
                        controller.selectedAccountType.value = value!;
                      },
                    )),
                const SizedBox(width: 4),
                Text(
                  'Current',
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
                      value: 'Savings​',
                      groupValue: controller.selectedAccountType.value,
                      onChanged: (value) {
                        controller.selectedAccountType.value = value!;
                      },
                    )),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  'Savings​',
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

  Widget _submitbuttons() {
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
              child: const Text('Cancel'),
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
        _cardName(),
        SizedBox(
          height: 10.h,
        ),
        _cardnumber(),
        SizedBox(
          height: 10.h,
        ),
        _bankName(),
        SizedBox(
          height: 10.h,
        ),
        _ifscCode(),
        SizedBox(
          height: 10.h,
        ),
        _accountType(),
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

  Widget _textData() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bank Ac(IN) Details',
            style: TextStyle(
              color: appTheme.cyan800,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Status: ',
              style: TextStyle(
                color: appTheme.cyan800,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              children: [
                TextSpan(
                  text: 'Bank Details Verified',
                  style: TextStyle(
                    color: appTheme.cyan800,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
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
                'Bank Account Profile Type',
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
                  'Bank Account Number',
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
                  'Name of the Bank Account Holder',
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

  Widget _bankName() {
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
                  'Bank Name',
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

  Widget _ifscCode() {
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
                  'IFSC Code',
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
                  'ICICI Bank',
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

  Widget _accountType() {
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
                  'Type of the Account',
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
                  'Current',
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Upload Copy of the Cancelled Cheque OR Passbook (1st page) OR Bank Statement',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.greytextcolour,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View Document',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.blue50,
                      ),
                    ),
                  ),
                ],
              ),
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
                SizedBox(height: 2.h),
                Text(
                  'Rejected',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: Colors.red,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
