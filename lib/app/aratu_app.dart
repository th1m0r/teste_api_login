import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_api_login/app/utils/app_routes.dart';
import 'package:teste_api_login/app/utils/color_schemes.g.dart';

class AratuApp extends StatelessWidget {
  const AratuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    Modular.setInitialRoute(AppRoutes.splashPage);

    return MaterialApp.router(
      title: "Teste de páginas iniciais",
      theme: tema.copyWith(colorScheme: lightColorScheme),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      debugShowCheckedModeBanner: false,
    );
  }
}
