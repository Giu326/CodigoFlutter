import 'package:flutter/material.dart';
import 'package:gerenciament_estado/snnipets.dart';
import 'package:gerenciament_estado/constantes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _senhacontroller = TextEditingController();
  bool _loading = false;

  _changeLoading() {
    setState(() {
      _loading = !_loading;
    });
  }

  _login() async {
    String email = _emailController.text;
    String senha = _senhacontroller.text;
    _changeLoading();
    await delay(2);
    if (email.isNotEmpty && senha.isNotEmpty) {
      showMessage(context, "Login foi realizado com sucesso :)");
    } else {
      showMessage(context, "Informe os dados para login :(");
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: backgroundImageStyle(background),
          ),
          Center(
            child: Container(
              width: 400,
              height: 400,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Login"),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _emailController,
                    decoration: roundTextField("Informe o seu email"),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                      controller: _senhacontroller,
                      decoration: roundTextField("Informe a sua senha")),
                  const SizedBox(height: 30),
                  if (_loading) ...{
                    loadingIndicator()
                  } else ...{
                    ElevatedButton(
                        onPressed: () {
                          _login();
                        },
                        child: Text("Entrar"))
                  }
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
