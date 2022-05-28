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
  primary: Colors.white,
  onSurface: Colors.black,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
);

Text _whiteText(String text) {
  return Text(
    text,
    style: const TextStyle(color: Colors.white),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;
  bool get isEmpty => count == 0;
  bool get isFull => count == 15;

  String statePhrase() {
    return !isFull ? 'Pode entrar' : 'Lotado';
  }

  void abandonouEstabelecimento() {
    if (isEmpty) {
      return;
    }

    count--;
  }

  void entrouEstabelecimento() {
    if (isFull) {
      return;
    }

    count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Colors.black, width: 3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    statePhrase(),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Text(
                '$count',
                style:
                    const TextStyle(fontSize: 128, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          entrouEstabelecimento();
                        });
                      },
                      style: _buttonStyle,
                      child: _whiteText("Entrou"),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          abandonouEstabelecimento();
                        });
                      },
                      style: _buttonStyle,
                      child: _whiteText("Saiu"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
