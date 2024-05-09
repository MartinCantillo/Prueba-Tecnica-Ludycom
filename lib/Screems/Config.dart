

import 'package:flutter/material.dart';

class PlayerNamesForm extends StatefulWidget {
   static const String nombre = 'PlayerNamesForm';
  @override
  _PlayerNamesFormState createState() => _PlayerNamesFormState();
}

class _PlayerNamesFormState extends State<PlayerNamesForm> {
  final TextEditingController _player1Controller = TextEditingController();
  final TextEditingController _player2Controller = TextEditingController();

  @override
  void dispose() {
    _player1Controller.dispose();
    _player2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: const Text(
            "Configuracion",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _player1Controller,
              decoration: InputDecoration(labelText: 'Nombre del jugador 1'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _player2Controller,
              decoration: InputDecoration(labelText: 'Nombre del jugador 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes manejar lo que sucede cuando se presiona el botón de enviar
                String player1Name = _player1Controller.text;
                String player2Name = _player2Controller.text;
                print('Jugador 1: $player1Name');
                print('Jugador 2: $player2Name');
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
