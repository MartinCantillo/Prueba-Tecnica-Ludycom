import 'package:flutter/material.dart';
import 'package:prueba/Screems/Empezar.dart';

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
      appBar: AppBar(
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
              decoration: InputDecoration(labelText: 'jugador 1'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _player2Controller,
              decoration: InputDecoration(labelText: 'Jugador 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String player1Name = _player1Controller.text;
                String player2Name = _player2Controller.text;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmpezarJ(
                      player1Name: player1Name,
                      player2Name: player2Name,
                    ),
                  ),
                );
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
