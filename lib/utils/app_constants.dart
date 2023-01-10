class AppConstants {
  static const APP_NAME = "DBfood";
  static const APP_VERSION = 1;

  static const String BASE_URL =
      "http://192.168.0.214:8000"; //192.168.0.214 // 192.168.1.16 //192.168.1.2
  static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular";
  static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";
  //static const String DRINKS_URI = "/ccdapi/v1/products/drinks";
  static const String UPLOAD_URL = '/uploads/';

  //User and Auth end points
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USERINfO_URI = "/api/v1/customer/info";

  //Location Address
  static const String USER_ADDRESS = "user_address";
  static const String GEOCODE_URI = "/api/v1/config/geocode-api";

  static const String TOKEN = "";

  static const String PHONE = "";
  static const String PASSWORD = "";

  static const String CART_LIST = "Cart-List";
  static const String CART_HISTORY_LIST = "Cart-History-List";
}
