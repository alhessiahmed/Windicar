class ApiSettings {
  static const String _baseUrl = 'https://car.windicar.com/api';
  static const String _auth = '$_baseUrl/auth';
  static const String register = '$_auth/register';
  static const String login = '$_auth/login';
  static const String logout = '$_auth/logout';
  static const String changePassword = '$_auth/change-password';
  static const String forgetPassword = '$_auth/forgot-password';
  static const String resetPassword = '$_auth/reset-password';
  static const String city = '$_baseUrl/city';
  static const String car = '$_baseUrl/car';
  static const String favorite = '$_baseUrl/favorite';
  static const String userDetails = '$_baseUrl/show/owner/';
}
