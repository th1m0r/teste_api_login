import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_api_login/app/pages/config_api_page.dart';
import 'package:teste_api_login/app/pages/dashboard_page.dart';
import 'package:teste_api_login/app/pages/inicial_page.dart';
import 'package:teste_api_login/app/pages/login_page.dart';
import 'package:teste_api_login/app/stores/api_store.dart';
import 'package:teste_api_login/app/stores/login_store.dart';
import 'package:teste_api_login/app/utils/app_routes.dart';

class AratuModule extends Module {
  @override
  List<Bind> get binds => [
        AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
        Bind.singleton((i) => ApiStore()),
        Bind.singleton((i) => LoginStore()),
    /*
    nao funciona
    Bind.singleton((i) => ApiStore(i())),
    Bind.singleton((i) => ApiStore(prefs: i())),
     */
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.inicialPage, child: (context, args) => const InicialPage()),
        ChildRoute(AppRoutes.configApi, child: (context, args) => const ConfigApiPage()),
        ChildRoute(AppRoutes.login, child: (context, args) => const LoginPage()),
        ChildRoute(AppRoutes.dashboard, child: (context, args) => const DashboardPage()),
      ];
}
