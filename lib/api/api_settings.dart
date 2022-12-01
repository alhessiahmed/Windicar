class ApiSettings {
  static const String _baseUrl = 'https://car.windicar.com/api';
  static const String _auth = '$_baseUrl/auth';
  static const String register = '$_auth/register';
  static const String login = '$_auth/login';
  static const String logout = '$_auth/logout';
  static const String changePassword = '$_auth/change-password';
  static const String forgetPassword = '$_auth/forget-password';
  static const String resetPassword = '$_auth/reset-password';
  static const String city = '$_baseUrl/city';
}
