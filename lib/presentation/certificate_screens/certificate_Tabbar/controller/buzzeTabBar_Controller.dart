import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:intl/intl.dart';

class CertificateTabBarController extends GetxController {
  final CacheService _cacheService = CacheService();

  final RxBool isDrawerOpen = false.obs;
  final RxList getScopeData = [].obs;
  RxString selectedScopeName = RxString('');
  RxString selectedScopeid = RxString('');
  final RxBool isDefaultView = false.obs;
  final box = GetStorage();
  var fromDate = ''.obs;
  var toDate = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getuserscopes();
    getstoragedata();
    getArguments();
  }

  var title = "".obs;

  void getArguments() {
    final arguments = Get.arguments as Map<String, dynamic>;
    title.value = arguments['title'];
  }

  void getstoragedata() async {
    String? scopeid = await _cacheService.getScopeid();
    String? scopeName = await _cacheService.getScopeName();
    selectedScopeName.value = scopeName ?? '';
    selectedScopeid.value = scopeid ?? '';
  }

  void getuserscopes() async {
    final userScopeList = await _cacheService.getUserScopeList();
    getScopeData.assignAll(userScopeList!.entries.map((entry) {
      return {
        'id': entry.key,
        'city': entry.value,
      };
    }).toList());
  }

  void setSelectedCity(String city) {
    selectedScopeName.value = city;
    var cityObject =
        getScopeData.firstWhere((element) => element['city'] == city);
    selectedScopeid.value = cityObject['id'];
  }

  void setCityName(String cityName, String cityid) async {
    // box.write('selectedCityName', cityName);
    // box.write('selectedCityid', cityid);
    selectedScopeName.value = cityName;
    selectedScopeid.value = cityid;
    await _cacheService.setCache(SCOPE_NAME, cityName);
    await _cacheService.setCache(SCOPE_ID, cityid);
  }

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  Future<void> selectDate(BuildContext context, bool isFromDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      if (isFromDate) {
        fromDate.value = formattedDate;
      } else {
        toDate.value = formattedDate;
      }
    }
  }
}
