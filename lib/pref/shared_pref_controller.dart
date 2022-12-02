import 'package:logo/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  id,
  name,
  email,
  phone,
  active,
  verified,
  city_id,
  token,
  isLoggedIn,
  firstVisit,
}

class SharedPrefController {
  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;

  SharedPrefController._();

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> loginForFirstTime() async {
    await _sharedPreferences.setBool(PrefKeys.firstVisit.name, true);
  }

  Future<void> save({required User user}) async {
    await _sharedPreferences.setBool(PrefKeys.isLoggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.phone.name, user.phone);
    await _sharedPreferences.setString(PrefKeys.name.name, user.name);
    await _sharedPreferences.setString(PrefKeys.email.name, user.email);
    await _sharedPreferences.setInt(PrefKeys.city_id.name, user.cityId);
    await _sharedPreferences.setString(
        PrefKeys.token.name, 'Bearer ${user.token}');
  }

  Future<bool> clear() async => _sharedPreferences.clear();

  Future<void> logout() async {
    await _sharedPreferences.setBool(PrefKeys.isLoggedIn.name, false);
    await _sharedPreferences.setString(PrefKeys.token.name, '');
    await _sharedPreferences.setInt(PrefKeys.id.name, -11);
  }

  T? getByKey<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.isLoggedIn.name) ?? false;

  bool get notFirstVisit =>
      _sharedPreferences.getBool(PrefKeys.firstVisit.name) ?? false;

  String get token => _sharedPreferences.getString(PrefKeys.token.name) ?? '';
}
