import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_api_login/app/aratu_app.dart';
import 'package:teste_api_login/app/aratu_module.dart';

Future<void> main() async {
  runApp(ModularApp(module: AratuModule(), child: const AratuApp()));
}
