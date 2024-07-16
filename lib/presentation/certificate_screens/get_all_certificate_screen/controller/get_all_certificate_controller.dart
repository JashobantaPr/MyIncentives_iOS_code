import 'package:flutter/widgets.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';

import '../../../../core/utils/cache_service.dart';
import '../model/get_all_certificate_model.dart';
import '../service/get_all_service.dart';

class GetAllCertificateController extends GetxController {
 
  TextEditingController commentcontroller = TextEditingController();
  Rx<getallcertificateModel> getAllCertificate = getallcertificateModel().obs;
  final CacheService _cacheService = CacheService();
  var isDislikedMap = <String, RxBool>{}.obs;
  RxBool isLoading = false.obs;
  RxBool isLike = false.obs;

  RxString firstName = ('').obs;
  RxString lastName = ('').obs;
  RxString profileImage = ('').obs;

  final likedPosts = <String, bool>{}.obs;
  @override
  void onInit() {
    super.onInit();

    getAllCertifictes();
  }

  Future<void> getAllCertifictes() async {
    isLoading.value = true; // Set loading to true
    final response =
        await getAllCertificateServices().getAllCertificatesDetails();
    if (response != null) {
      print('getAll$response');
      getAllCertificate.value = getallcertificateModel.fromJson(response);
      print('getAllCertificates${getAllCertificate.value}');
    }
    isLoading.value = false; // Set loading to false
  }

  Future<void> likepost(
      String postId, String firstname, String lastname) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    try {
      var bodyFields = {
        'type': 'post',
        'last_name': lastname,
        'first_name': firstname,
        'user_id': userId ?? '',
        'company_id': companyId ?? '',
        'postid': postId,
        'com_post_id': ''
      };
      // Check if the post is already liked
      if (likedPosts[postId] == true) {
        var dislike = await getAllCertificateServices().removeLike(bodyFields);
        if (dislike == 'success') {
          likedPosts[postId] = false; // Update likedPosts map
          print('Removed like: $dislike');
        }
      } else {
        var like = await getAllCertificateServices().addlike(bodyFields);
        if (like == 'success') {
          likedPosts[postId] = true; // Update likedPosts map
          print('Added like: $like');
        }
      }
    } catch (e) {
      print('No Buzzes $e');
    }
  }

  void addcomment(String firstName, String lastName, String postId) async {
    try {
      isLoading.value = true;
      String? userId = await _cacheService.getUserId();
      String? companyId = await _cacheService.getCompanyId();
      print('firstName: $firstName, lastName: $lastName, postId: $postId');

      var bodyFields = {
        'company_id': companyId ?? '',
        'own_id': userId ?? '',
        'postid': postId,
        'product_code': 'P00003',
        'f_name': firstName,
        'l_name': lastName,
        'comment': commentcontroller.text
      };
      print('bodyFields: $bodyFields');
      String? response =
          await getAllCertificateServices().addcomment(bodyFields);

      if (response != null) {
        print('Response from addcomment: $response');
        await getAllCertificate(); // Call getAllCertificate after successful comment addition
        commentcontroller.clear();
      } else {
        print('Failed to add comment');
      }
    } catch (e) {
      print('Error adding comment: $e');
    } finally {
      isLoading.value = false; // End loading, whether successful or not
    }
  }
}
