import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_api_login/app/aratu_module.dart';
import 'package:teste_api_login/app/infra/local_storage/local_storage_interface.dart';
import 'package:teste_api_login/app/utils/app_constants.dart';
import 'package:teste_api_login/app/utils/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future init() async {
    await Modular.isModuleReady<AratuModule>();
    await Future.delayed(const Duration(seconds: 3));

    final prefs = Modular.get<ILocalStorage>();

    final usuario = prefs.getString("usuario");
    final urlApi = prefs.getString(AppConstants.urlApi);

    if (urlApi.isEmpty) {
      Modular.to.navigate(AppRoutes.configApi);
    }
    if (usuario.isEmpty) {
      Modular.to.navigate(AppRoutes.login);
    }
    Modular.to.navigate(AppRoutes.dashboard);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
      backgroundColor: Colors.grey,
    );
  }
}
