class EndPoint {
  static String baseUrl = "https://supermarket-dan1.onrender.com/api/v1/";
  static String signIn = "auth/signIn";
  static String signUp = "auth/signUp";
  static String resetPasswordCode= "auth/resetPassCode";
  static String activeResetPassword= "auth/activeResetPass";
  static String resetPassword= "auth/resetPassword";
  /// Products...
  static String products ="home/products";
  static String getAllCategory ="home/categories";
  static String brands ="home/brands";
  static String searchProduct ="home/productsFilter";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}
