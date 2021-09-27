import 'package:flutter/material.dart';

import 'home.dart';
import 'login_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: Colors.lightGreen[200]),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// Future<DataModel> submitData() {

// }

class MedEntry {
  final String name;
  final String comp;
  final String usage;

  MedEntry(this.name, this.comp, this.usage);
  @override
  String toString() {
    return 'Medicine: name= $name, composition= $comp, usage= $usage';
  }
}

/*class StoreEntry {
  final String store;
  final String comp;
  final String usage;

  MedEntry(this.store, this.comp, this.usage);
  @override
  String toString() {
    return 'Medicine: name= $store, composition= $comp, usage= $usage';
  }
}*/
