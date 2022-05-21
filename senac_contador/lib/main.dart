import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

ButtonStyle _buttonStyle = TextButton.styleFrom(
  backgroundColor: Colors.black,
  primary: Colors.black,
  onSurface: Colors.black,
  shape: const BeveledRectangleBorder(),
);

Text _whiteText(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.white),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: _buttonStyle,
                      child: _whiteText("Alinhado a esquerda"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: _buttonStyle,
                      child: _whiteText("Centro"),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: _buttonStyle,
                      child: _whiteText("Centro"),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: _buttonStyle,
                      child: _whiteText("Centro"),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: _buttonStyle,
                      child: _whiteText("Centro"),
                    )
                  ],
                ),
                const Text("Pode Entrar",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
                const Text("0")
              ],
            )));
  }
}
