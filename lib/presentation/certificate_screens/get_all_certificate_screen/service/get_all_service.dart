import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';

import '../../../../data/api_secvices/api_url.dart';

class getAllCertificateServices {
  final CertificateTabBarController scopeController =
      Get.find<CertificateTabBarController>();
  final CacheService _cacheService = CacheService();
  Future<Map<String, dynamic>?> getAllCertificatesDetails() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=n1p6gcjqscqmjhpcobk6i7v26tkv1po0'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/engagements/posts_api/'));
    // request.bodyFields = {'company_id': '80', 'posts_type': 'Certificates'};
    request.bodyFields = {
      'own_id': userId!,
      'company_id': companyId!,
      'posts_type': 'Certificates',
      'start': '0',
      'end': '9',
      'comp_code': 'COMP000080',
      'scope_id': scopeController.selectedScopeid.value,
      'keyword': '',
      'from': '',
      'to': '',
      'filter': ''
    };
    request.headers.addAll(headers);
    print('bodyyy${request.bodyFields}');
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      print(responseString);
      return json.decode(responseString); // Decode the response and return it
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String> addlike(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=198p9taae3p06k6qdl9okropuof51crg'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/addLike'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final addedlike = jsonResponse['status'];
      print('Add Like Response: $jsonResponse'); // Debug print
      return addedlike;
    } else {
      print(response.reasonPhrase);
      return '';
    }
  }

  Future<String?> removeLike(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ph2tfru4mbnk5f6ode4ufntucud09vis'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/removeLike'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final removelike = jsonResponse['status'];
      print('Remove Like Response: $jsonResponse'); // Debug print
      return removelike;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String?> addcomment(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=05pd8kto00d4fmp6sbiv5nvvkl18k03f'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//engagements/postComment'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final addcomment = jsonResponse['comment'];
      return addcomment;
    } else {
      print('Error: ${response.reasonPhrase}');
      return null;
    }
  }
}
