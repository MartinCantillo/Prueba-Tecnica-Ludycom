import 'package:flutter/material.dart';

class EmpezarJ extends StatefulWidget {
  
  
  static const String nombre = 'EmpezarJ';
  @override
  _EmpezarJState createState() => _EmpezarJState();
}

class _EmpezarJState extends State<EmpezarJ> {
  int player1Score = 0;
  int player2Score = 0;

  void resetScores() {
    setState(() {
      player1Score = 0;
      player2Score = 0;
    });
  }

  void player1Scores() {
    setState(() {
      if (player1Score == 3 && player2Score == 3) {
        player1Score++;
      } else if (player1Score == 3 && player2Score < 3) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('¡Jugador 1 gana el juego!'),
              content: Text('¡Felicidades!'),
              actions: [
                TextButton(
                  onPressed: () {
                    resetScores();
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        player1Score++;
      }
    });
  }

  void player2Scores() {
    setState(() {
      if (player1Score == 3 && player2Score == 3) {
        player2Score++;
      } else if (player2Score == 3 && player1Score < 3) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('¡Jugador 2 gana el juego!'),
              content: Text('¡Felicidades!'),
              actions: [
                TextButton(
                  onPressed: () {
                    resetScores();
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        player2Score++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Juego empezado",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Jugador 1: $player1Score',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Jugador 2: $player2Score',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    player1Scores();
                  },
                  child: Text('Punto para Jugador 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    player2Scores();
                  },
                  child: Text('Punto para Jugador 2'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
