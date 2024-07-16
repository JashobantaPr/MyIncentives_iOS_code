import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

class MyAccountService {
  final CacheService _cacheService = CacheService();
  Future<bool> deleteuserToken() async {
    String? userId = await _cacheService.getUserId();
    String? userToken = await _cacheService.getUserToken();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=650aoalv2a28utv3j1nuql1v2pietut3'
    };
    var request = http.Request('POST', Uri.parse(Url.deleteusertoken));
    request.bodyFields = {'user_token': userToken!, 'user_id': userId!};
    print('sdkahf ${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonresponse = jsonDecode(json);
      print('jsdfhf $jsonresponse');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> fcmTokenDelete() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=qhg4n6cbk62ub6vfspk62i9fm5d2p3p9'
    };
    var request = http.Request('POST', Uri.parse(Url.deletefcmtoken));
    request.bodyFields = {
      'token':
          'daZqAHo5wVmEiNfQUzDuUc:APA91bHKXjElNjHxTZ5_M7bnqGSGI51Dcbkef5-sky0d_U7bekWC08VukexT0WUBEZdoCjrj0DHBvDn4TlDnEtHYPnj6tQDHdnYjk1R-EuJTxguAyR6bF9Txod4iwukGE8qiIv ExOOup',
      'user_id': userId!,
      'type': 'delete',
      'company_id': companyId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonresponse = jsonDecode(json);
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }
}
