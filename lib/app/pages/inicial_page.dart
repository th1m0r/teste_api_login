import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_api_login/app/pages/config_api_page.dart';
import 'package:teste_api_login/app/pages/dashboard_page.dart';
import 'package:teste_api_login/app/pages/login_page.dart';
import 'package:teste_api_login/app/stores/app_store.dart';
import 'package:teste_api_login/app/utils/app_routes.dart';

class InicialPage extends StatelessWidget {
  const InicialPage({Key? key}) : super(key: key);

  /*
  Essa pagina nao terá visualizacao. Apenas a logica para saber se
  há endereço de API na store ou um usuario. A partir disso direcionar
  /config-api
  /login
  /dashboard
   */
  @override
  Widget build(BuildContext context) {
    print("processando se existe api cadastrada na store");
    final store = context.watch<AppStore>();
    return FutureBuilder(
      future: store.tryLoadApi(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          switch (snapshot.data) {
            case AppRoutes.dashboard:
              return const DashboardPage();
            case AppRoutes.login:
              return const LoginPage();
            default:
              return const ConfigApiPage();
          }
        }
      },
    );
  }
}
