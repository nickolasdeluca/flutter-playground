import 'package:flutter/material.dart';
import 'package:flutter_rest_requests/components/main_scaffold.dart';
import 'package:flutter_rest_requests/screens/setup/setup.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(children: [
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Teste",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          primary: Colors.black,
                          onSurface: Colors.black,
                          shape: const StadiumBorder()),
                      onPressed: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Setup()));
                      }),
                      child: const Text('Next Screen'))),
            ],
          )),
    ]);
  }
}
