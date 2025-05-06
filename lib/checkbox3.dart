import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // warna tombol
            foregroundColor: Colors.white, // warna teks tombol
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue, // warna AppBar
          foregroundColor: Colors.white, // warna teks AppBar
        ),
      ),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _checkboxVal1 = false;
  bool _checkboxVal2 = false;
  bool _checkboxVal3 = false;
  bool _checkboxVal4 = false;
  List<String> list = [];

  void _updateList(bool value, String language) {
    setState(() {
      if (value) {
        if (!list.contains(language)) {
          list.add(language);
        }
      } else {
        list.remove(language);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Percobaan Menggunakan Widget')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // untuk checkbox tetap rata kiri
          children: <Widget>[
            Center(
              child: Text(
                'Bahasa pemrograman yang dikuasai:',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxVal1,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal1 = value!;
                      _updateList(value, 'Python');
                    });
                  },
                ),
                const Text('Python'),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxVal2,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal2 = value!;
                      _updateList(value, 'Javascript');
                    });
                  },
                ),
                const Text('Javascript'),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxVal3,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal3 = value!;
                      _updateList(value, 'PHP');
                    });
                  },
                ),
                const Text('PHP'),
              ],
            ),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _checkboxVal4,
                  onChanged: (bool? value) {
                    setState(() {
                      _checkboxVal4 = value!;
                      _updateList(value, 'Java');
                    });
                  },
                ),
                const Text('Java'),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Data: ${list.join(', ')}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
