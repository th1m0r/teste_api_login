import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_api_login/app/aratu_module.dart';
import 'package:teste_api_login/app/infra/local_storage/local_storage_interface.dart';
import 'package:teste_api_login/app/utils/app_constants.dart';
import 'package:teste_api_login/app/utils/app_routes.dart';

class AppStore extends ChangeNotifier {
  String? _url;
  String? _usuario;
  String? _token;

  final ILocalStorage localStorage;

  AppStore({
    required this.localStorage,
  });

  _init() async {
    await Modular.isModuleReady<AratuModule>();
    _url = localStorage.getString(AppConstants.urlApi);
    _usuario = localStorage.getString("usuario");
    print("executando o metodo init(): URL: $_url. Usuario: $_usuario");
  }

  //fim do bloco que funcionou

  bool get isApi {
    return _url != null;
  }

  bool get isAuth {
    return _usuario != null;
  }

  Future<String> tryLoadApi() async {
    await _init();
    if (isApi) {
      if (isAuth) {
        return AppRoutes.dashboard;
      } else {
        return AppRoutes.login;
      }
    } else {
      return AppRoutes.configApi;
    }
  }

  Future<void> save(String ip, String porta) async {
    final url = "http://$ip:$porta";
    localStorage.saveString(AppConstants.urlApi, url).then((value) {
      _url = url;
      notifyListeners();
    });
  }

  Future<void> login(String usuario, String senha) async {
    final user = "$usuario:$senha";
    localStorage.saveString("usuario", user).then((value) {
      _usuario = user;
      notifyListeners();
    });
  }

  Future<void> remove() async {
    await localStorage.remove(AppConstants.urlApi).then((value) {
      logout().then((value) {
        _url = null;
        _usuario = null;
        _token = null;
        notifyListeners();
      });
    });
  }

  Future<void> logout() async {
    await localStorage.remove("usuario").then((value) {
      _usuario = null;
      _token = null;
      notifyListeners();
    });
  }

  String get url {
    return _url ?? "";
  }

  String get usuario {
    return _usuario ?? "";
  }
}
