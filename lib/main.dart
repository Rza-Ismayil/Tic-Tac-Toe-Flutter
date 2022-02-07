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

  List<List<String>> board = [
    ['', '', ''],
    ['', 'X', ''],
    ['', 'O', '']
  ];

  Widget genBtn(int x, int y) {
    return SizedBox(
      height: 80.0,
      width: 80.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          board[x][y],
          style: TextStyle(fontSize: 40.0),
        ),
      ),
    );
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
            onPressed: () {},
            child: const Text('restart'),
          )
        ],
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
