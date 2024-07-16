import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_approval_history/model/typeC_flexiform_approval_history_model.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_approval_history/service/typec_claimapprovalservice.dart';

class FlexiFormApprovalController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();

  var isObscure = true.obs;
  var allClaims = <Campaign>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchClaimApproval();
  }

  void fetchClaimApproval() async {
    try {
      var fetchedClaims = await TypeCClaimApproval().getClaimApproval();
      if (fetchedClaims != null) {
        allClaims.assignAll(fetchedClaims);

        // Access each claim in the list and print its claim code
        for (var claim in allClaims) {
          print('Claim Code: ${claim.claimId}');
        }
      } else {
        allClaims.clear();
      }
    } catch (e) {
      print("Failed to fetch claim: $e");
    }
  }
}
