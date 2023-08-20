
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
  static String getNotifications({required int page, required int limit,required int userId}) => "/users/$userId/notifications?per_page=$limit&page=$page";
  static String getPropertyReviews({required int page, required int limit,required int propertyId}) => "/$propertyId/ratings?per_page=$limit&page=$page";


  static String getAllProperties = "/properties";

  static const String nearbyProperties = "/properties/near-by-places";

  static const String country = "/regions/get-all";
  static const String reportCategory = "/report-categories";
  static const String reportUser = "/user/report-client";

  static const String addAgricultural = "/agriculturals";
  static const String addCommercial = "/commercials";
  static const String addResidential = "/residentials";


  static const String promoteToAgency = "/agencies";
  static  String isFavorite(int propertyId) => "/properties/$propertyId/is-favorite";
  static  String saveFavorite = "/properties/save";
  static const String requestAgencyStatus = "/agencies/request-status";
  static const String myFavorite = "/properties/my-favorites";

  static String deleteAgriculturalProperty(int id) => "/agriculturals/$id";
  static String deleteCommercialProperty(int id) => "/commercials/$id";
  static String deleteResidentialProperty(int id) => "/residentials/$id";

  static String editAgriculturalProperty(int id) => "/agriculturals/$id";
  static String editCommercialProperty(int id) => "/commercials/$id";
  static String editResidentialProperty(int id) => "/residentials/$id";

  static String rateProperty(int id) => "/properties/$id/rate";
  static String myPropertyRate(int propertyId) => "/properties/$propertyId/my-rating";


}