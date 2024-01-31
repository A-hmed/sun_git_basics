import 'package:flutter/material.dart';
import 'package:sun_basics_flutter/model/GameBoardArgs.dart';
import 'package:sun_basics_flutter/screens/xo/xo_button.dart';

class GameBoard extends StatefulWidget {
  static const String routeName = "game_board";

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> board = [
    "", "", "",
    "", "", "",
    "", "", "",
  ];
  int counter = 0;
  int player1Score = 0;
  int player2Score = 0;
  @override
  Widget build(BuildContext context) {
    GameBoardArgs args = ModalRoute.of(context)!.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "${args.player1}: $player1Score",
                    style: const TextStyle(fontSize: 32),
                  ),
                  Text(
                    "${args.player2}: $player2Score",
                    style: const TextStyle(fontSize: 32),
                  ),
                ],
              )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoButton(
                  symbol: board[0],
                  onClick: onButtonClick,
                  index: 0,
                ),
                XoButton(
                  symbol: board[1],
                  onClick: onButtonClick,
                  index: 1,
                ),
                XoButton(
                  symbol: board[2],
                  onClick: onButtonClick,
                  index: 2,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoButton(
                  symbol: board[3],
                  onClick: onButtonClick,
                  index: 3,
                ),
                XoButton(
                  symbol: board[4],
                  onClick: onButtonClick,
                  index: 4,
                ),
                XoButton(
                  symbol: board[5],
                  onClick: onButtonClick,
                  index: 5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XoButton(
                  symbol: board[6],
                  onClick: onButtonClick,
                  index: 6,
                ),
                XoButton(
                  symbol: board[7],
                  onClick: onButtonClick,
                  index: 7,
                ),
                XoButton(
                  symbol: board[8],
                  onClick: onButtonClick,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onButtonClick(int index){
    if(board[index].isNotEmpty) return;
    if(counter % 2 == 0){
      board[index] = "o";
    }
    else {
      board[index] = "x";
    }
    if(checkWinner(board[index])){
      /// reset board
      /// increase player score
      if(board[index] == "o"){
        player1Score++;
      }else {
        player2Score++;
      }
      resetBoard();
      return;
    }
    if(counter == 8){
      resetBoard();
      return;
    }
    counter++;
    setState(() {});
  }

  void resetBoard() {
    board = [
      "", "", "",
      "", "", "",
      "", "", "",
    ];
    counter = 0;
    setState(() {});
  }

  bool checkWinner(String symbol){
    ///Rows Checks
    if(board[0] == symbol && board[1] == symbol && board[2] == symbol){
      return true;
    }
    if(board[3] == symbol && board[4] == symbol && board[5] == symbol){
      return true;
    }
    if(board[6] == symbol && board[7] == symbol && board[8] == symbol){
      return true;
    }
    /// Columns Checks
    if(board[0] == symbol && board[3] == symbol && board[6] == symbol){
      return true;
    }
    if(board[1] == symbol && board[4] == symbol && board[7] == symbol){
      return true;
    }
    if(board[2] == symbol && board[5] == symbol && board[8] == symbol){
      return true;
    }
    /// 2 DIAGONALS
    if(board[0] == symbol && board[4] == symbol && board[8] == symbol){
      return true;
    }
    if(board[2] == symbol && board[4] == symbol && board[6] == symbol){
      return true;
    }
    return false;
  }
}
