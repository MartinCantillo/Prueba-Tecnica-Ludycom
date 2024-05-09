import 'package:flutter/material.dart';
import 'package:prueba/Screems/Config.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  static const String nombre = 'myhome';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Bienvenido al Juego",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.account_circle_sharp,
                  size: 100.5,
                ),
              ),
              ListTile(
                title: const Text('Configurar'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayerNamesForm(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
