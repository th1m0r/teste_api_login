import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_api_login/app/stores/app_store.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final store = context.watch<AppStore>();
    final usuario = store.usuario;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aratu mobile"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                store.logout();
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      drawer: Drawer(
          child: Column(
        children: [
          AppBar(
            title: Text("Bem vindo, $usuario"),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          TextButton(
              onPressed: () {
                store.remove();
              },
              child: const Text("Sair")),
        ],
      )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Hello World, Dashboard!",
              style: TextStyle(fontSize: 32),
            ),
            Text(
              usuario,
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
