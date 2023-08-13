
class EndPoints{

  static const String kMainUrl = "https://costa.st.90-soft.com/api";
  static const String kMainUrlAssets = "https://costa.st.90-soft.com/";
  //static const String kMainUrl = "http://192.99.246.34:8000/api";

  static const String sendSMS = "/sms/verify";
  static const String verifyAndSignUp = "/sms/verify-and-register";
  static const String login = "/login";
  static const String logout = "/user/logout";
  static const String editUser = "/user/update";


  static String getAmenities({required int page, required int limit}) => "/amenities?per_page=$limit&page=$page";
  static String getTags({required int page, required int limit}) => "/tags?per_page=$limit&page=$page";

  static String getAllProperties = "/properties";

  static const String nearbyProperties = "/properties/near-by-places";

  static const String country = "/regions/get-all";

  static const String addAgricultural = "/agriculturals";
  static const String addCommercial = "/commercials";
  static const String addResidential = "/residentials";


  static const String promoteToAgency = "/agencies";
  static  String isFavorite(int propertyId) => "/properties/$propertyId/is-favorite";
  static  String saveFavorite = "/properties/save";
  static const String requestAgencyStatus = "/agencies/request-status";



}