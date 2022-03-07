import 'package:flutter/material.dart';

class ChildScaffold extends StatelessWidget {
  final List<Widget> children;

  const ChildScaffold({Key? key, required this.children}) : super(key: key);

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          bottom: true,
          child: Stack(children: [
            BackButton(
              color: Colors.white,
              onPressed: (() {
                Navigator.pop(context);
              }),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: children))
          ]),
        ));
  }
}
