import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_api_login/app/utils/app_constants.dart';

class ApiStore extends ChangeNotifier {
  bool _isApi = false;

  /*
  Assim nao funciona
  final _prefs = Modular.get<SharedPreferences>();
   */

  /*
  Assim tambem nao funciona
  late SharedPreferences _prefs;
  ApiStore(SharedPreferences prefs) {
    _prefs = prefs;
  }
   */

  /*
  Assim tambem nao
  final SharedPreferences prefs;
  ApiStore({this.prefs});
   */

  //So "funcionou" assim
  late SharedPreferences _prefs;

  ApiStore() {
    _init();
  }

  _init() async {
    _prefs = await SharedPreferences.getInstance();
  }
  //fim do bloco que funcionou

  tryLoadApi() async {
    if (isApi) return;
    final url = _prefs.getString(AppConstants.urlApi);
    if (url == null) {
      return;
    } else {
      if (url.isEmpty) {
        return;
      }
      _isApi = true;
      notifyListeners();
    }
  }

  Future<void> save(String ip, String porta) async {
    final url = "http://$ip:$porta";
    _prefs.setString(AppConstants.urlApi, url).then((value) {
      _isApi = true;
      notifyListeners();
    });
  }

  Future<void> remove() async {
    await _prefs.remove(AppConstants.urlApi).then((value) {
      _isApi = false;
      notifyListeners();
    });
  }

  String get url {
    final usuario = _prefs.getString(AppConstants.urlApi);
    return usuario ?? "";
  }

  bool get isApi => _isApi;
}
