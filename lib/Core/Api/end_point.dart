class EndPoint {
  static String baseUrl = "https://supermarket-dan1.onrender.com/api/v1/";
  static String signIn = "signIn";
  static String signUp = "signUp";
  static String resetPasswordCode= "resetPassCode";
  static String activeResetPassword= "activeResetPass";
  static String resetPassword= "resetPassword";
  static String searchProduct ="home/productsFilter";
  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}
