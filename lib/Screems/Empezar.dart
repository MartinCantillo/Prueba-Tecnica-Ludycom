import 'package:flutter/material.dart';

class EmpezarJ extends StatefulWidget {
  final String player1Name;
  final String player2Name;

  EmpezarJ({required this.player1Name, required this.player2Name});

  @override
  _TennisGameState createState() => _TennisGameState();
}

class _TennisGameState extends State<EmpezarJ> {
  int player1Score = 0;
  int player2Score = 0;
  int player1GamesWon = 0;
  int player2GamesWon = 0;
  bool deuce = false;
  bool advantagePlayer1 = false;
  bool advantagePlayer2 = false;
  bool gameEnded = false;

  void resetScores() {
    setState(() {
      player1Score = 0;
      player2Score = 0;
      deuce = false;
      advantagePlayer1 = false;
      advantagePlayer2 = false;
    });
  }

  void checkGameEnded() {
    if ((player1Score >= 4 && player1Score - player2Score >= 2) ||
        (player2Score >= 4 && player2Score - player1Score >= 2)) {
      if (player1Score > player2Score) {
        player1GamesWon++;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('¡${widget.player1Name} gana el juego!'),
              content: Text('¡Felicidades!'),
              actions: [
                TextButton(
                  onPressed: () {
                    resetScores();
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        player2GamesWon++;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('¡${widget.player2Name} gana el juego!'),
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
      }
      setState(() {
        gameEnded = true;
      });
    }
  }

  void playerScores(int player) {
    if (gameEnded) return;

    setState(() {
      if (deuce) {
        if (player1Score == player2Score) {
          player == 1 ? player1Score++ : player2Score++;
        } else if (player1Score - player2Score == 1 && player == 1) {
          player1Score++;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('¡${widget.player1Name} gana el juego!'),
                content: Text('¡Felicidades!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      resetScores();
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          setState(() {
            gameEnded = true;
          });
        } else if (player2Score - player1Score == 1 && player == 2) {
          player2Score++;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('¡${widget.player2Name} gana el juego!'),
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
          setState(() {
            gameEnded = true;
          });
        } else {
          deuce = false;
          player == 1 ? player1Score++ : player2Score++;
        }
      } else {
        if (player1Score == 3 && player2Score == 3) {
          deuce = true;
        } else if (player1Score == 4 && player2Score < 3) {
          player1Score++;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('¡${widget.player1Name} gana el juego!'),
                content: Text('¡Felicidades!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      resetScores();
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          setState(() {
            gameEnded = true;
          });
        } else {
          player == 1 ? player1Score++ : player2Score++;
        }
      }

      if (!gameEnded) {
        checkGameEnded();
      }
    });
  }

  String translateScore(int score) {
    switch (score) {
      case 0:
        return '0';
      case 1:
        return '15';
      case 2:
        return '30';
      case 3:
        return '40';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Juego de Tenis",
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
              '${widget.player1Name}: ${translateScore(player1Score)}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${widget.player2Name}: ${translateScore(player2Score)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    playerScores(1);
                  },
                  child: Text('Punto para ${widget.player1Name}'),
                ),
                ElevatedButton(
                  onPressed: () {
                    playerScores(2);
                  },
                  child: Text('Punto para ${widget.player2Name}'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
