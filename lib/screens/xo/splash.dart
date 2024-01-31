import 'package:flutter/material.dart';
import 'package:sun_basics_flutter/screens/xo/game_board.dart';

import '../../model/GameBoardArgs.dart';

class Splash extends StatelessWidget {
  static String routeName = "splash";
  Splash({super.key});
  String player1 = "";
  String player2 = "";
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Splash"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: TextFormField(
                 decoration: const InputDecoration(
                   hintText: "Player 1"
                 ),
                 onChanged: (text){
                   player1 = text;
                 },
                validator: (text){
                   if(text!.length < 6){
                     return "please enter a valid password";
                   }
                   return null;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: TextField(
                decoration: const InputDecoration(
                    labelText: "Player 2"
                ),
                onChanged: (text){
                  player2 = text;
                },
              ),
            ),
            const Spacer(flex: 2,),
            Container(
                margin: const EdgeInsets.all(12),
                child: ElevatedButton(onPressed: (){
                  if(!formKey.currentState!.validate()) return;
                  Navigator.pushNamed(context,
                      GameBoard.routeName,
                      arguments: GameBoardArgs(player1, player2));
                }, child: const Text("Start"))),
            const Spacer(flex: 1,),
          ],
        ),
      ),
    );
  }
}


