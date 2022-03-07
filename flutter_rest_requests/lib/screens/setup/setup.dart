import 'package:flutter/material.dart';
import 'package:flutter_rest_requests/components/child_scaffold.dart';
import 'package:http/http.dart' as http;

class Setup extends StatelessWidget {
  const Setup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChildScaffold(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Stack(
            children: [
              const TextField(
                decoration: InputDecoration(labelText: 'Teste'),
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
                        http
                            .get(Uri.parse(
                                'https://jsonplaceholder.typicode.com/todos/1'))
                            .then((value) {
                          var snackBar = SnackBar(content: Text(value.body));

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }),
                      child: const Text('Request')))
            ],
          ),
        )
      ],
    );
  }
}
