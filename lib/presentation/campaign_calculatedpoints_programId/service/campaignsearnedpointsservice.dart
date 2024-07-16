import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/model/trasnactionmodel.dart';

class CampaignCalculatedPointsService {
  final CacheService _cacheService = CacheService();
  Future<List<int?>> yearDropdown() async {
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=1u7v66fg8uk520o0j8hjc23jbirhap7q'
    };
    var request = http.Request('POST', Uri.parse(Url.getfilteryear));
    request.bodyFields = {'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final programsParticipant = jsonResponse['date_range'] as List<dynamic>;
      List<int?> years =
          programsParticipant.map<int?>((value) => value as int?).toList();

      return years;
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<List<Transaction>> transactiondata(int year) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=3li9i5ep2vf8eafbbf3b9nvci2uj76bk'
    };
    var request = http.Request('POST', Uri.parse(Url.getprogramtransaction));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments[1]['programId']
    };
    print('lkskkks${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      final List<dynamic> transactionsJson =
          jsonResponse['data'] as List<dynamic>;

      return transactionsJson
          .map((json) => Transaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load transactions: ${response.reasonPhrase}');
    }
  }

  Future<List<Transaction>> transactiondataAll() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=3li9i5ep2vf8eafbbf3b9nvci2uj76bk'
    };
    var request = http.Request('POST', Uri.parse(Url.getprogramtransaction));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments[1]['programId'],
      'transaction_type': '3',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      final List<dynamic> transactionsJson =
          jsonResponse['data'] as List<dynamic>;

      print('transactionsJson  $transactionsJson');

      return transactionsJson
          .map((json) => Transaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load transactions: ${response.reasonPhrase}');
    }
  }
}
