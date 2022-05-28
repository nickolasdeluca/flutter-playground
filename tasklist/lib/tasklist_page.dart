import 'package:flutter/material.dart';

class TaskListPage extends StatelessWidget {
  TaskListPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  void login() {
    String text = emailController.text;
    print('email $text');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'exemplo@exemplo.com.br',
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: (() {
                  login();
                }),
                child: const Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
