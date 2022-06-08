

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../SelectionScreen/selectionScreen.dart';
import '../model/game_model.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final snackBar = SnackBar(
    content: "Yay! Correct 🥳".text.center.make(),
    backgroundColor: Colors.green,
  );
  final snackBar1 = SnackBar(
    content: "Opps! Wrong 😥".text.center.make(),
    backgroundColor: Colors.red,
  );

  List<Data>? items = [];
  List<Data>? items2 = [];
  late bool gameOver;
  late int score;

  bool? accepting = false;

  get child => null;

  @override
  void initState() {
    score = 0;
    gameOver = false;
    super.initState();
    getFruitsData();
    initGame();
    // setState(() {
    //
    //
    //
    //
    // });
  }

  initGame() {
    //  gameOver = true;
    score = 0;
  }

  QuerySnapshot? fruitsSnapshot;

  getFruitsData() async {
    fruitsSnapshot = await FirebaseFirestore.instance.collection("Game").get();
    items = fruitsSnapshot!.docs
        .map((element) => Data.fromJson(element.data() as Map<String, dynamic>))
        .toList();
    items2 = fruitsSnapshot!.docs
        .map((element) => Data.fromJson(element.data() as Map<String, dynamic>))
        .toList();


    items?.shuffle();
    items = items?.take(3).toList();
    print("-------- ITEMS 1");
    items?.forEach((element) {
      print(element.name);
    });
    items2=[];
    print(items2);
    items2?.addAll(items!);
    print("------ITEMS 2");
    items2?.forEach((element) {
      print(element.name);
    });
    items2?.shuffle();
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    //if (items!.length != 0) ;
    // gameOver = true
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      appBar: AppBar(
        backgroundColor: Colors.green.shade700,
        title: Text('Drag & Drop Game').text.make(),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SelectionScreen()));
          }, icon: Icon(Icons.home))
        ],
      ),
      body: fruitsSnapshot==null?Center(
        child: Container(
            height: 30,
            width: 30,
            child: CircularProgressIndicator()),
      ):SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              "https://img.freepik.com/free-photo/empty-blackboard-with-chalks-vintage-wooden-background_1387-525.jpg?t=st=1654624159~exp=1654624759~hmac=287c3c93788d9d0589031c8568212d93252a411a86e4dfbb5a987be1b7a25b99&w=1060",
              height: context.screenHeight,
              width: context.screenWidth,
              fit: BoxFit.cover,
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets5.lottiefiles.com/packages/lf20_csytzc80.json',
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: "Score: ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    TextSpan(
                        text: "$score",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0))
                  ])),
                ],
              ),
              if (items!.length != 0)
                Container(
                  height: 600,
                  width: 800,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: items?.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: <Widget>[
                            Column(children: [
                              Draggable<Data>(
                                  data: items![index],
                                  feedback: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                    child: Image.network(
                                      items![index].imgurl.toString(),
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  childWhenDragging: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                    child: Image.network(
                                      items![index].imgurl.toString(),
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                      colorBlendMode: BlendMode.softLight,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                    child: Image.network(
                                      items![index].imgurl.toString(),
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ))
                            ]).p12(),
                            Spacer(),
                            Expanded(
                              child: Container(
                                  child: DragTarget<Data>(
                                    onAccept: (receivedItem) {
                                      if (items2![index].value ==
                                          receivedItem.value) {
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(snackBar);
                                        setState(() {
                                          items2![index].accepting = true;
                                          items2!.removeWhere((dataList) =>
                                          dataList.imgurl ==
                                              receivedItem.imgurl);
                                          items!.removeWhere((dataList) =>
                                          dataList.imgurl ==
                                              receivedItem.imgurl);

                                          score += 10;
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar1);
                                        setState(() {
                                          score -= 5;
                                          items![index].accepting = false;
                                        });
                                      }
                                    },
                                    onLeave: (receivedItem) {
                                      setState(() {
                                        items![index].accepting = false;
                                      });
                                    },
                                    onWillAccept: (receivedItem) {
                                      setState(() {
                                        items![index].accepting = true;
                                      });
                                      return true;
                                    },
                                    builder:
                                        (context, acceptedItems, rejectedItems) =>
                                        VxBox(

                                            child: Text(
                                              items2![index].name.toString(),
                                            ).text.white.xl.makeCentered().p4()).height(120).width(120).roundedFull.color(Colors.redAccent).makeCentered(),
                                  )),
                            )
                          ],
                        );
                      }),
                ),
              if (items!.length == 0)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          child: RaisedButton(
                            color: Colors.redAccent,
                            child: Text("New game"),
                            onPressed: () {

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => GamePage()));

                              //  initGame();
                              // setState(() {});
                            },
                          ),
                        ),
                        20.widthBox,
                        Container(
                          width: 150,
                          child: MaterialButton(
                            color: Colors.redAccent,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SelectionScreen()));
                            },
                            child: Text("Exit Game"),
                          ),
                        ),
                      ],
                    ),
                    50.heightBox,
                    Text('Your Score is $score',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
            ]).centered(),
          ],
        ),
      ),
    );
  }
}