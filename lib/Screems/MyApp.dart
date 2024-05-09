import 'package:flutter/material.dart';
import 'package:prueba/Screems/Config.dart';
import 'package:prueba/Screems/MyHomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prueba Tecnica ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: MyHomePage.nombre,
        routes: {
          MyHomePage.nombre: (context) => const MyHomePage(),
          PlayerNamesForm.nombre: (context) => PlayerNamesForm(),
          //EmpezarJ.nombre: (context) => EmpezarJ(),
        },
        home: const MyHomePage());
  }
}
