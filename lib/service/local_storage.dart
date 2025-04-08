import 'package:open_astro/service/app_loger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late SharedPreferences _prefs;
  LocalStorage() {
    init();
  }
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    appLoger(tag: 'Localstorage', message: 'initialized');
  }

  //setter
  Future<void> setOnboardedUser() async {
    // _prefs == null ? await init() : null;
    await _prefs.setBool('onBoarded', true);
  }

  Future<void> setToken({required String token}) async {
    // _prefs == null ? await init() : null;
    await _prefs.setString('token', token);
  }

  Future<void> setLatest(bool? isLatest) async {
    // _prefs == null ? await init() : null;
    await _prefs.setBool('latest', isLatest ?? true);
  }

  Future<void> setLatestFalse() async {
    // _prefs == null ? await init() : null;
    await _prefs.setBool('latest', false);
  }

  //getter
  Future<bool> getOnboardingStatus() async {
    // _prefs == null ? await init() : null;
    return _prefs.getBool('onBoarded') ?? false;
  }

  Future<bool> getlatestStatus() async {
    // _prefs == null ? await init() : null;
    return _prefs.getBool('latest') ?? false;
  }

  Future<String> getToken() async {
    // _prefs == null ? await init() : null;
    return _prefs.getString('token') ?? '';
  }

  //remover
  Future<bool> removeToken() async {
    // _prefs == null ? await init() : null;
    return await _prefs.remove('token');
  }
}
