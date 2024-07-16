class Url {
  static const String baseUrl =
      'https://staging.myincentives.co.in/index.php/apis/';

  static const String imageUrl =
      "https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/";

  static const String profileimageUrl =
      "https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/profile/";

  static const String behaviourimageUrl =
      "https://staging.myincentives.co.in/assets/uploads/";

  static const String buzzvideourl =
      "https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/video/";

  static const String buzzaudiourl =
      "https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/audio/";

  // Notification
  static const String getAllNotification =
      "${baseUrl}home/get_all_notification";
  static const String readAllNotification =
      "${baseUrl}home/read_all_notification/";

  // Resend OTP
  static const String resendOTP = "${baseUrl}login/phone_verify_otp";
  static const String resendOTP1 = "${baseUrl}login/new_user_validate";

  // Forget Password
  static const String otp = "${baseUrl}login/phone_verify_otp/";

  // Campaign
  static const String pointscount =
      "${baseUrl}programs/get_program_point_dashboard";
  static const String campaigns = "${baseUrl}programs/get_active_program_list";
  static const String banners =
      "${baseUrl}programs/get_program_banners_on_home";
  static const String bannersaccess = "${baseUrl}programs/get_access";
  static const String companyprofile =
      "${baseUrl}Company/getcompany_profile?company_id=80";

  // My Campaign
  static const String mycampaigns = "${baseUrl}programs/get_program_list";

  // Type A Leaderboard

  static const String leaderBoard = "${baseUrl}programs/get_program_detail";

  // Campaigns Earned Points
  static const String getparticipantprograms =
      "${baseUrl}programs/get_participant_programs";
  static const String getfilteryear = "${baseUrl}programs/get_filter_year";
  static const String getprogramtransaction =
      "${baseUrl}programs/get_program_transaction";
  static const String getwalletdetails = "${baseUrl}budget/get_wallet_details";

  // Type A
  static const String gettargetdata = "${baseUrl}programs/get_target_data";

  //Type D
  static const String getprogramdetail =
      "${baseUrl}programs/get_program_detail";
  static const String kpidisplaytarget =
      "${baseUrl}automated_incentives/kpi_display_target";
  static const String getmongotabledata =
      "${baseUrl}automated_incentives/get_mongo_table_data";
  static const String getcalculatedpayout =
      "${baseUrl}automated_incentives/get_calculated_payout";
  static const String addclaimformfields =
      "${baseUrl}programs/add_claim_form_fields/";
  static const String saveUserClaim = "${baseUrl}Claims/saveUserClaim";

  // Buzzes
  static const String buzzesposts = "${baseUrl}engagements/posts_api/";
  static const String getallcommentapi = "${baseUrl}home/getallcomments_api";
  static const String awardPoints = "${baseUrl}home/awardPoints";
  static const String gettaggedusers = "${baseUrl}home/gettaggedusers";
  static const String viewmybudget = "${baseUrl}budget/view_my_budget";

  // Hub
  static const String hubsectionlist = "${baseUrl}/hub/section_list";
  static const String hubsectionfiles = "${baseUrl}/hub/section_files";
  static const String hubfileproperty = "${baseUrl}/hub/hubfileproperty";
  static const String hubfilepropertys = "${baseUrl}/hub/hubfileproperty";
  static const String hubsectionfilter = "${baseUrl}/hub/filter_sections_files";
  static const String hubSearch = "${baseUrl}/hub/search";

  // Type A
  static const String pointddashboard =
      "${baseUrl}/programs/get_program_point_dashboard";
  static const String getProgrammes =
      "${baseUrl}/programs/get_program_point_dashboard";

  // Type C
  static const String getProgramme = "${baseUrl}/programs/get_program_detail";
  static const String getcliam = "${baseUrl}/claims/get_claim_summary";
  static const String getallcliam =
      "${baseUrl}/programs/claimMangementuserData";
  static const String showbutton = "${baseUrl}/claims/showClaimManagement";
  static const String claimDetails = "${baseUrl}/claims/claimDatabyID";
  static const String claimApproval = "${baseUrl}/programs/getClaimApproval";
  static const String rejectClaim = "${baseUrl}/claims/rejectClaim";
  static const String getslabvalue = "${baseUrl}claims/get_slab_value";

  // Engagement // Certificate
  static const String certificateLeader =
      "${baseUrl}/engagements/trending_certificates";
  static const String myAchievement =
      "${baseUrl}/engagements/earned_certificates";
  static const String buzzSearch = "${baseUrl}//engagements/search_user";
  static const String buzzAudio = "${baseUrl}//home/audio_upload";
  static const String createAward =
      "${baseUrl}/engagements/verifyAndAwardCertificate/";

  // Type B and Type C KPI SKU
  static const String getleaderboardtypeb =
      "${baseUrl}//programs/get_leaderboard_view";
  static const String getpointdashboardtypeb =
      "${baseUrl}/programs/get_program_point_dashboard";
  static const String leaderBoardtypeb =
      "${baseUrl}programs/get_program_detail";
  static const String getclaimsummarytypec =
      "${baseUrl}/claims/get_claim_summary";
  static const String getclaimmanagementdatatypec =
      "${baseUrl}/programs/claimMangementuserData";
  static const String getSkuDetailsSingleSelectapp =
      "${baseUrl}/programs/getSkuDetailsSingleSelectapp/";

  // My Order
  static const String myOrders = "${baseUrl}redemption/MyOrder_api";
  static const String viewDetails =
      "${baseUrl}redemption/show_indudual_orderhistory_api";
  static const String voucherDisplay = "${baseUrl}/Orders/voucher_display";
  static const String companyProfile = "${baseUrl}settings/company_profile";
  static const String orderOtp = "${baseUrl}/redemption/otp_to_placeorder";

  // Help and Support
  static const String usermanual = "${baseUrl}/usermanual/getManualForAndroid";
  static const String getticketsummary = "${baseUrl}tickets/get_ticket_summary";
  static const String listusertickets = "${baseUrl}tickets/list_user_tickets";

  // My Rewards
  static const String scopewiserewardsproducts =
      "${baseUrl}redemption/scopewise_rewards_products";
  static const String wallettypes = "${baseUrl}redemption/wallet_types";
  static const String rewardCategories =
      "${baseUrl}redemption/reward_Categories";
  static const String redeemsupercheque =
      "${baseUrl}supercheques/redeem_supercheque";
  static const String mywalletpointapi =
      "${baseUrl}redemption/mywallet_point_api";

  // My Account
  static const String deleteusertoken = "${baseUrl}login/delete_user_token";
  static const String deletefcmtoken = "${baseUrl}fcm/fcm_token";
}
