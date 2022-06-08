



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/views/quiz_play.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../SelectionScreen/selectionScreen.dart';

class Results extends StatefulWidget {
  final int total, correct, incorrect, notattempted;
  Results(
      { required this.incorrect,
        required this.total,
        required this.correct,
        required this.notattempted});

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  // late ConfettiController _controllerCenter;
  void initState() {
    // _controllerCenter =
    //     ConfettiController(duration: const Duration(seconds: 4));
    super.initState();
  }

  void dispose() {
    // _controllerCenter.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: VxAppBar(
        title: "Results".text.make(),
        centerTitle: true,
        backgroundColor: Colors.orange.shade600,
        // backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Image.network("https://img.freepik.com/free-photo/textured-blackboard-with-chalks-eraser_53876-147515.jpg?t=st=1654660138~exp=1654660738~hmac=3a02ec3c7a951ada9f7258194b6998fe7655ea8240493fbd0888a965f9abd464&w=1060",height: context.screenHeight,
            width: context.screenWidth,fit: BoxFit.cover,),
          Container(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.correct >=6?
                  Container(
                    child:  Column(
                      children: [
                        Text("Good Job!!").text.semiBold.xl2.white.make(),
                        Lottie.network(
                            'https://assets7.lottiefiles.com/packages/lf20_xldzoar8.json',
                            height: 100,
                            width: 150,
                            fit: BoxFit.cover),
                      ],
                    ),
                  ):
                  Container(
                    child:  Column(
                      children: [
                        Text("Well Done!You want to try again").text.white.semiBold.xl2.make(),
                        Lottie.network(
                            'https://assets2.lottiefiles.com/private_files/lf30_ll1hdda1.json',
                            height: 100,
                            width: 150,
                            fit: BoxFit.cover),
                      ],
                    ),
                  )
                  ,


                  50.heightBox,
                  Text(
                    "Score : ${widget.correct}/ ${widget.total}",
                  ).text.xl3.semiBold.white.make().p4(),

                  5.heightBox,
                  "Correct: ${widget.correct}".text.white.xl2.make().p4(),
                  "Wrong: ${widget.incorrect}".text.white.xl2.make().p4(),

                  40.heightBox,

                ],
              ),
            ),
          ),
          Positioned(
            bottom: context.isMobile?30:100,left: context.isMobile?context.screenWidth*0.2:context.screenWidth*0.4,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectionScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Go to home",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ),
                10.widthBox,
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizPlay()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "New Game",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Align buildButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: VxBox(
        child: TextButton(
          onPressed: () {
            // _controllerCenter.play();
          },
          child: "Congratulations!".text.bold.xl5.letterSpacing(0.2).makeCentered(),
        ),
      ).height(80).width(context.screenWidth*0.70).red500.make(),
    );
  }
}