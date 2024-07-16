import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'controller/qr_controller.dart';

class Qrcodescanner extends GetWidget<QrcodescannerController> {
  const Qrcodescanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Scan Code',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0XFFE21D39),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: controller.qrKey,
              onQRViewCreated: controller.onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: const Color(0XFFFFFFFF),
                borderRadius: 1,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: controller.getScanArea(context),
              ),
              onPermissionSet: (ctrl, p) =>
                  controller.onPermissionSet(context, ctrl, p),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        onPressed: () {
                          if (controller.isFlashOn.value) {
                            controller.qrController?.toggleFlash();
                          }
                        },
                        child: Obx(() => Icon(controller.isFlashOn.value
                            ? Icons.flash_on
                            : Icons.flash_off)),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.transparent)),
                        onPressed: () {
                          controller.qrController?.flipCamera();
                        },
                        child: const Icon(Icons.flip_camera_android),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.transparent)),
                    onPressed: () {
                      controller.pickImage();
                    },
                    child: const Text('Pick from Gallery'),
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => Text(
                      'Scan Result: ${controller.result.value}',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
