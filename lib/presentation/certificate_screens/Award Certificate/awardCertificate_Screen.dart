import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/controller/awardCertificate_controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/model/model.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AwardCertificateScreen extends GetWidget<AwardCertificateController> {
  final AwardCertificateController buzz9Controller =
      Get.put(AwardCertificateController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFE41C39),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 214, 213, 213),
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              "Award Certificate",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color(0XFFE41C39),
            iconTheme: const IconThemeData(color: Colors.white),
            leading: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  ImageConstant.arrowback,
                  width: 6.7.w,
                  height: 8.7.h,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                _buildBuzzCard(context),
                const SizedBox(width: 20),
                _buttoncontainer(),
                const SizedBox(width: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBuzzCard(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0XFFFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      'Select Post Type',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF383853),
                      ),
                    ),
                    Text(
                      '*',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Obx(
                      () => Radio<String>(
                        value: 'SingleScope',
                        groupValue: buzz9Controller.isSelected.value,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          buzz9Controller.isSelected.value = value!;
                          print(buzz9Controller.isSelected.value);
                        },
                      ),
                    ),
                    const Text(
                      'Create post in existing scope - ',
                      style: TextStyle(
                        color: Color(0XFF191919),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '${controller.scopeName}',
                      style: const TextStyle(
                        color: Color(0XFF191919),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Obx(
                      () => Radio<String>(
                        value: 'GlobalScope',
                        groupValue: buzz9Controller.isSelected.value,
                        activeColor: Colors.black,
                        onChanged: (value) {
                          buzz9Controller.isSelected.value = value!;
                          print(buzz9Controller.isSelected.value);
                        },
                      ),
                    ),
                    const Text(
                      'Create global post for all scopes​',
                      style: TextStyle(
                        color: Color(0XFF191919),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => Visibility(
              visible: buzz9Controller.isSelected.value == 'SingleScope',
              child: singleScope(context),
            ),
          ),
          Obx(
            () => Visibility(
              visible: buzz9Controller.isSelected.value == 'GlobalScope',
              child: globalScope(context),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }

  //SingleScope
  Widget singleScope(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineTile(
            isFirst: true,
            isLast: false,
            title: '1',
            child: _buildStepCard1('Select User', context),
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: false,
            title: '2',
            child: _buildStepCard2('Add Description'),
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: true,
            title: '3',
            child: _buildStepCard3('Select Certificate'),
          ),
        ],
      ),
    );
  }

//GloberScope
  Widget globalScope(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTimelineTile(
            isFirst: true,
            isLast: false,
            title: '1',
            child: _buildStepCard1('Select User', context),
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: false,
            title: '2',
            child: _buildStepCard2('Add Description'),
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: true,
            title: '3',
            child: _buildStepCard3('Select Certificate'),
          ),
        ],
      ),
    );
  }

// stepsTimeline Widget

  Widget _buildTimelineTile({
    required bool isFirst,
    required bool isLast,
    required String title,
    required Widget child,
  }) {
    int index = int.parse(title) - 1; // Convert title to index
    return Obx(
      () => TimelineTile(
        axis: TimelineAxis.vertical,
        alignment: TimelineAlign.start,
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0.11,
          width: 35,
          height: 35,
          color: controller.stepsCompleted[index]
              ? const Color(0XFF017F00)
              : Colors.black12,
          indicator: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0XFFE4E4E4), width: 2),
              shape: BoxShape.circle,
              color: controller.stepsCompleted[index]
                  ? const Color(0XFF017F00)
                  : Colors.white,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: controller.stepsCompleted[index]
                      ? Colors.white
                      : const Color(0XFF191919),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        beforeLineStyle: LineStyle(
          color: controller.stepsCompleted[index]
              ? const Color(0XFF017F00)
              : Colors.grey,
          thickness: 1,
        ),
        afterLineStyle: LineStyle(
          color: controller.stepsCompleted[index]
              ? const Color(0XFF017F00)
              : Colors.grey,
          thickness: 1,
        ),
        endChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            child,
          ],
        ),
      ),
    );
  }

//Step-1
  Widget _buildStepCard1(String title, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: const BorderRadius.all(
            Radius.circular(1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                controller.isUserExpanded.value =
                    !controller.isUserExpanded.value;
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 3, bottom: 3, left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            color: Color(0XFF191919),
                            fontSize: 15,
                            fontWeight: FontWeight.w400)),
                    Obx(() {
                      return Icon(
                        controller.isUserExpanded.value
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_up,
                        size: 30,
                        color: Colors.grey,
                      );
                    }),
                  ],
                ),
              ),
            ),
            Obx(() {
              return Visibility(
                visible: controller.isUserExpanded.value,
                child: Column(
                  children: [
                    const Divider(height: 1, color: Colors.black),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.search_outlined,
                              color: appTheme.greydownarrow,
                              size: 25,
                            ),
                            const SizedBox(width: 2),
                            Expanded(
                              child: TextField(
                                controller: controller.serchcontroller,
                                onChanged: (value) {
                                  controller.filterUsers(value);
                                  if (value.isNotEmpty) {
                                    _showModal(context);
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search User',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w300),
                                  border: InputBorder.none,
                                  isDense: true,
                                  contentPadding: const EdgeInsets.all(10),
                                ),
                                style: const TextStyle(color: Colors.black),
                                textAlignVertical: TextAlignVertical.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (controller.selectedUsers.isEmpty) {
                        return const Center(child: Text(''));
                      } else {
                        return Column(
                          children: controller.selectedUsers.map((user) {
                            var userprofile =
                                'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080${user.profile}';

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 2),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.red, width: 1.5),
                                        ),
                                        child: ClipOval(
                                          child: Image.network(userprofile,
                                              width: 25.w,
                                              height: 25.h,
                                              fit: BoxFit.cover, errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                            return Container(
                                              width: 25.w,
                                              height: 25.h,
                                              color: Colors.white,
                                              child: const Icon(
                                                Icons.image_outlined,
                                                weight: 1,
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: SizedBox(
                                          width: 120,
                                          child: Text(
                                            '${user.firstName} ${user.lastName}',
                                            style: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          controller
                                              .removeUserFromSelection(user);
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.red,
                                          ),
                                          child: const Center(
                                            child: Icon(Icons.close,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }
                    }),
                    const SizedBox(height: 10),
                  ],
                ),
              );
            }),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: appTheme.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset:
                        Offset(0, 3), // changes position of shadow to bottom
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//Step-2

  Widget _buildStepCard2(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      if (controller.selectedUsers.isNotEmpty) {
                        controller.isDescriptionExpanded.value =
                            !controller.isDescriptionExpanded.value;
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(color: Colors.black),
                          ),
                          Obx(
                            () => Icon(
                              controller.isDescriptionExpanded.value
                                  ? Icons.keyboard_arrow_down
                                  : Icons.arrow_forward_ios,
                              size: controller.isDescriptionExpanded.value
                                  ? 25
                                  : 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    return Visibility(
                      visible: controller.isDescriptionExpanded.value,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Divider(height: 1, color: Colors.black),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Radio(
                                activeColor: Colors.red,
                                value: 'Text',
                                groupValue: controller.selectedRadio.value,
                                fillColor: const MaterialStatePropertyAll(
                                    Color(0XFFE21D39)),
                                onChanged: (value) {
                                  Get.dialog(
                                    CustommodelScreen(
                                      onConfirm: () {
                                        controller.removeAudioFile();

                                        controller.selectedRadio.value = value!;
                                        Get.back();
                                      },
                                    ),
                                  );
                                },
                              ),
                              const Text('Text',
                                  style: TextStyle(
                                      color: Color(0XFFE21D39), fontSize: 18)),
                              const SizedBox(width: 20),
                              Radio(
                                activeColor: Colors.red,
                                value: 'Audio',
                                groupValue: controller.selectedRadio.value,
                                fillColor: const MaterialStatePropertyAll(
                                    Color(0XFFE21D39)),
                                onChanged: (value) {
                                  Get.dialog(
                                    CustommodelScreen(
                                      onConfirm: () {
                                        controller.discription.clear();

                                        controller.selectedRadio.value = value!;
                                        Get.back(); // Close the dialog
                                      },
                                    ),
                                  );
                                },
                              ),
                              const Text('Audio',
                                  style: TextStyle(
                                      color: Color(0XFFE21D39), fontSize: 18)),
                              const SizedBox(width: 20),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Visibility(
                            visible: controller.selectedRadio.value == 'Text',
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextField(
                                    controller: controller.discription,
                                    onChanged: (value) {
                                      controller.updateStepCompletion();
                                    },
                                    decoration: const InputDecoration(
                                      hintText: 'Description',
                                      hintStyle: TextStyle(
                                          fontWeight: FontWeight.w300),
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(0),
                                    ),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: controller.selectedRadio.value == 'Audio',
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Obx(
                                        () => Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            controller.pickedFilePath.value
                                                    .isEmpty
                                                ? 'Audio'
                                                : controller
                                                    .pickedFilePath.value
                                                    .split('/')
                                                    .last,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () async {
                                      await controller.pickAudioFile();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF6D6D6D),
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 54, 27, 27)),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Icon(Icons.mic,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Obx(() {
                            return Visibility(
                              visible:
                                  controller.selectedRadio.value == 'Video',
                              child: const Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Select Video',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(height: 1, color: Colors.black),
                                  SizedBox(height: 10),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Text(
                                      'While Uploading: Video size Max 20Mb, File Format MP4.\nWhile Recording: Video Length Max 60 Seconds.',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          Visibility(
                            visible: controller.selectedRadio.value == 'Audio',
                            child: audioConatiner(),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  }),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: appTheme.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(
                              0, 3), // changes position of shadow to bottom
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Buttom Container
  _buttoncontainer() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Obx(
              () => Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  color: buzz9Controller.isCancelTapped.value
                      ? const Color(0XFFE41C39)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextButton(
                  onPressed: () {
                    buzz9Controller.toggleCancel();
                  },
                  child: Text(
                    'Cancel',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: buzz9Controller.isCancelTapped.value
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Obx(
              () => Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  color: buzz9Controller.isBuzzTapped.value
                      ? const Color(0XFFE41C39)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextButton(
                  onPressed: () async {
                    await controller.Createbuzz();
                  },
                  child: Text(
                    'Award',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: buzz9Controller.isBuzzTapped.value
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard3(String title) {
    final selectedImage = RxString(Get.arguments?['selectedImage'] ?? '');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      if (buzz9Controller.discription.text.isNotEmpty ||
                          buzz9Controller.pickedFilePath.isNotEmpty) {
                        buzz9Controller.toggleBehaviourExpanded();
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              title,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          Obx(() => Padding(
                                padding: const EdgeInsets.all(10),
                                child: Icon(
                                  buzz9Controller.isBehaviourExpanded.value
                                      ? Icons.keyboard_arrow_down
                                      : Icons.arrow_forward_ios,
                                  size:
                                      buzz9Controller.isBehaviourExpanded.value
                                          ? 25
                                          : 15,
                                  color: Colors.grey,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 1),
        Center(
          child: Obx(() {
            return Visibility(
              visible: buzz9Controller.isBehaviourExpanded.value,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: selectedImage.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Stack(
                          children: [
                            Container(
                              width: 265,
                              height: 80,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                //borderRadius: BorderRadius.circular(0),
                              ),
                              child: Center(
                                child: Image.network(
                                  selectedImage.value,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () {
                                  selectedImage.value = '';
                                  Get.arguments?['selectedImage'] = '';
                                  Get.arguments
                                      ?.refresh(); // Refresh Get arguments
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                            if (buzz9Controller.isImageRemoving.value)
                              Positioned.fill(
                                child: Container(
                                  color: Colors.black.withOpacity(0.5),
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    : Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          //borderRadius: BorderRadius.circular(0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.toNamed(AppRoutes.certificate7);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(180, 60),
                          ),
                          child: Text(
                            'Choose Certificate',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
              ),
            );
          }),
        ),
      ],
    );
  }

//Audio Conatiner===========================
  Widget audioConatiner() {
    return Obx(() {
      if (controller.pickedFilePath.isEmpty) {
        return const SizedBox();
      } else {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (controller.isPlaying.value) {
                      controller.stopAudio();
                    } else {
                      controller.playAudio(controller.pickedFilePath.value);
                    }
                  },
                  child: Icon(
                    controller.isPlaying.value
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   controller
                        //       .pickedFilePath.value
                        //       .split('/')
                        //       .last,
                        //   style: TextStyle(
                        //     fontFamily: GoogleFonts
                        //             .poppins()
                        //         .fontFamily,
                        //     fontWeight:
                        //         FontWeight.bold,
                        //     fontSize: 18,
                        //   ),
                        // ),
                        Slider(
                          value: controller.position.value.inSeconds.toDouble(),
                          max: controller.duration.value.inSeconds.toDouble(),
                          onChanged: (value) {
                            final position = Duration(seconds: value.toInt());
                            controller.player.seek(position);
                          },
                          activeColor: Colors.red,
                          inactiveColor: Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${controller.position.value.toString().split('.').first}',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${controller.duration.value.toString().split('.').first}',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.removeAudioFile();
                  },
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.red, width: 3)),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                        weight: 5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        );
      }
    });
  }

  void _showModal(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.white,
          content: Container(
            width: MediaQuery.of(context).size.width - 60,
            height: 400,
            color: Colors.white,
            child: Obx(() {
              return ListView.builder(
                itemCount: controller.filteredUsers.length,
                itemBuilder: (context, index) {
                  var user = controller.filteredUsers[index];
                  var userProfile =
                      'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/${user.profile}';
                  return GestureDetector(
                    onTap: () {
                      controller.addUserToSelection(user);
                      Navigator.of(context)
                          .pop(); // Close the modal after selection
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.red, width: 1.5),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  userProfile,
                                  width: 25.w,
                                  height: 25.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 25.w,
                                      height: 25.h,
                                      color: Colors.white,
                                      child: const Icon(
                                        Icons.image_outlined,
                                        size: 24,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${user.firstName} ${user.lastName}',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Location: ${user.email ?? 'N/A'}',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        );
      },
    );
  }
}
