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
        body: Column(children: [
           Card(
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjoNk9PiETzm8B2ULHMrDLZE6__7bnqjniX7nWZm8QoQ&s", height: 100),
                
          ),
           
          Row(
            children: [
              Card(
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_mAYw7EjK6rEpxM5JooCxV32mqzEl1juxAfmHiyg35Q&s", height: 100),
                    
              ),
             
            ],
          ),
          Card(
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYOykzwx5BgMc2F4aMSTaHm1savF_0hXh35s6qX2uqzw&s" , height: 100),
                
          ),
           Row(
             children: [
               Card(
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTro4H-4xuWAwqgb-yUBePOYXreXosxguCReZboYSbvEg&s", height: 100),
                        
                  ),
             ],
           ),
         
        ]),
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
