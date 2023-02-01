import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:teste_api_login/app/pages/config_api_page.dart';
import 'package:teste_api_login/app/pages/dashboard_page.dart';
import 'package:teste_api_login/app/pages/inicial_page.dart';
import 'package:teste_api_login/app/pages/login_page.dart';
import 'package:teste_api_login/app/pages/splash_page.dart';
import 'package:teste_api_login/app/stores/app_store.dart';
import 'package:teste_api_login/app/utils/app_routes.dart';

import 'infra/local_storage/local_storage_impl.dart';
import 'infra/local_storage/local_storage_interface.dart';

class AratuModule extends Module {
  @override
  List<Bind> get binds => [
        AsyncBind<SharedPreferences>(
          (i) => SharedPreferences.getInstance(),
          export: true,
        ),
        Bind<ILocalStorage>(
          ((i) => LocalStorageService(prefs: i())),
          export: true,
        ),
        Bind.factory(
          (i) => AppStore(localStorage: i()),
          export: true,
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.splashPage, child: (context, args) => const SplashPage()),
        ChildRoute(AppRoutes.inicialPage, child: (context, args) => const InicialPage()),
        ChildRoute(AppRoutes.configApi, child: (context, args) => const ConfigApiPage()),
        ChildRoute(AppRoutes.login, child: (context, args) => const LoginPage()),
        ChildRoute(AppRoutes.dashboard, child: (context, args) => const DashboardPage()),
      ];
}
