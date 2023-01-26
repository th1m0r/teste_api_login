import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStore extends ChangeNotifier {
  late SharedPreferences _prefs; // = Modular.get<SharedPreferences>();
  bool _isAuth = false;

  LoginStore() {
    //_prefs = prefs;
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  tryAutoLogin() async {
    if (isAuth) return;
    final usuario = _prefs.getString("usuario");
    if (usuario == null) {
      return;
    } else {
      if (usuario.isEmpty) {
        return;
      }
      _isAuth = true;
      notifyListeners();
    }
  }

  Future<void> login(String username, String password) async {
    await _prefs.setString("usuario", "$username:$password").then((value) {
      _isAuth = true;
      notifyListeners();
    });
  }

  Future<void> logout() async {
    await _prefs.remove("usuario").then((value) {
      _isAuth = false;
      notifyListeners();
    });
  }

  String get user {
    final usuario = _prefs.getString("usuario");
    return usuario ?? "";
  }

  bool get isAuth => _isAuth;
}
