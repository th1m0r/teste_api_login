import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_api_login/app/stores/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  _submit() {
    final isValid = _formLoginKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    final username = _username.text;
    final password = _password.text;
    final store = context.read<LoginStore>();
    store.login(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
          child: Form(
            key: _formLoginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: TextFormField(
                    controller: _username,
                    validator: (value) {
                      final username = value ?? '';
                      if (username.isEmpty) {
                        return "Usuário é obrigatório";
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_passwordFocus);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: TextFormField(
                    controller: _password,
                    focusNode: _passwordFocus,
                    validator: (value) {
                      final password = value ?? '';
                      if (password.isEmpty) {
                        return "A senha é obrigatória";
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      _submit();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: TextButton(
                    onPressed: () {
                      _submit();
                    },
                    child: const Text(
                      "Entrar",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
