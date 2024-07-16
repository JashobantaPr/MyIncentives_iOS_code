import 'dart:convert';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_4/model/helpmanual_4_model.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_4/service/helpmanual_4_service.dart';

class HelpandSupportHelpManual4Controller extends GetxController {
  var helpusermanualList = <Module>[].obs;
  var searchContentList = <SearchContent>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchhelpusermanualList();
  }

  void fetchhelpusermanualList() async {
    print('ijuhygtfrdeswdcfvgb');
    try {
      var response = await HelpUserMAnualListService().usermodule();
      if (response != null) {
        var apiResponse = ApiResponse.fromJson(jsonDecode(response));
        helpusermanualList.assignAll(apiResponse.modules);
        searchContentList.assignAll(apiResponse.searchContent);

      }
    } catch (e) {
      print("Failed to fetch helpusermanual list: $e");
    }
  }
}
