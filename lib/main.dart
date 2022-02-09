import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Center(
          child: Text("Tic Tac Toe"),
        ),
      ),
      body: const SafeArea(child: MyApp()),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String winnerData = '';
  String turn = 'X';
  bool gameOver = false;
  List<List<String>> board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', '']
  ];

  Widget genBtn(int x, int y) {
    return SizedBox(
      height: 80.0,
      width: 80.0,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            pressed(x, y);
          });
        },
        child: Text(
          board[x][y],
          style: const TextStyle(fontSize: 40.0),
        ),
      ),
    );
  }

  void pressed(int x, int y) {
    if (board[x][y] == '' && !gameOver) {
      board[x][y] = turn;
      checkForWin();
      changeTurn();
    }
  }

  void changeTurn() {
    if (turn == 'X') {
      turn = 'O';
    } else {
      turn = 'X';
    }
  }

  void checkForWin() {
    if ((board[0][0] == turn && board[0][1] == turn && board[0][2] == turn) ||
        (board[1][0] == turn && board[1][1] == turn && board[1][2] == turn) ||
        (board[2][0] == turn && board[2][1] == turn && board[2][2] == turn) ||
        (board[0][0] == turn && board[1][0] == turn && board[2][0] == turn) ||
        (board[0][1] == turn && board[1][1] == turn && board[2][1] == turn) ||
        (board[0][2] == turn && board[1][2] == turn && board[2][2] == turn) ||
        (board[0][0] == turn && board[1][1] == turn && board[2][2] == turn) ||
        (board[2][0] == turn && board[1][1] == turn && board[0][2] == turn)) {
      gameOver = true;
      winnerData = turn + ' WINS';
      return;
    }
    bool isTie = true;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == '') {
          isTie = false;
        }
      }
    }
    if (isTie) {
      gameOver = true;
      winnerData = 'Tie';
    }
  }

  void reset() {
    gameOver = false;
    winnerData = '';
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j] = '';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.0,
      height: 600.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              genBtn(0, 0),
              genBtn(0, 1),
              genBtn(0, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              genBtn(1, 0),
              genBtn(1, 1),
              genBtn(1, 2),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              genBtn(2, 0),
              genBtn(2, 1),
              genBtn(2, 2),
            ],
          ),
          SizedBox(
            height: 50.0,
            child: Text(winnerData),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                reset();
              });
            },
            child: const Text('restart'),
          )
        ],
      ),
    );
  }
}
