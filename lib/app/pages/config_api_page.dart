import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_api_login/app/stores/app_store.dart';

class ConfigApiPage extends StatefulWidget {
  const ConfigApiPage({Key? key}) : super(key: key);

  @override
  State<ConfigApiPage> createState() => _ConfigApiPageState();
}

class _ConfigApiPageState extends State<ConfigApiPage> {
  final _enderecoIP = TextEditingController();
  final _porta = TextEditingController();
  final _portaFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _enderecoIP.dispose();
    _porta.dispose();
    _portaFocus.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    final ip = _enderecoIP.text;
    final porta = _porta.text;
    final store = context.read<AppStore>();
    store.save(ip, porta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro API'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, right: 16, left: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Configure os dados de acesso a API.",
                  style: TextStyle(
                      fontFamily: 'Rubik',
                      fontSize: 30,
                      color: Colors.black54,
                      fontWeight: FontWeight.w300)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10,),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _enderecoIP,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Endereco IP'),
                  validator: (value) {
                    final ip = value ?? '';
                    if (ip.isEmpty) {
                      return 'Digite um IP válido.';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_portaFocus);
                  },
                ),
              ),
              TextFormField(
                controller: _porta,
                focusNode: _portaFocus,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Porta'),
                validator: (value) {
                  final porta = value ?? '';
                  if (porta.isEmpty) {
                    return 'Digite uma porta válida';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  _submit();
                },
              ),
              TextButton(
                onPressed: () {
                  _submit();
                },
                child: const Text('Salvar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
