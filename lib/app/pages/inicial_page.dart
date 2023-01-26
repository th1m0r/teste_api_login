import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_api_login/app/pages/config_api_page.dart';
import 'package:teste_api_login/app/pages/login_page.dart';
import 'package:teste_api_login/app/stores/api_store.dart';

class InicialPage extends StatefulWidget {
  const InicialPage({Key? key}) : super(key: key);

  @override
  State<InicialPage> createState() => _InicialPageState();
}

class _InicialPageState extends State<InicialPage> {
  @override
  void initState() {
    super.initState();
  }

  /*
  Essa pagina nao terá visualizacao. Apenas a logica para saber se
  há endereço de API na store ou um usuario. A partir disso direcionar
  /config-api
  /login
  /dashboard
   */
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
