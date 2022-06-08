import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GameData extends StatefulWidget {
  GameData({Key? key}) : super(key: key);

  @override
  _QuizDataState createState() => _QuizDataState();
}

class _QuizDataState extends State<GameData> {
  final ref = FirebaseFirestore.instance.collection("Game");
  final _formKey = GlobalKey<FormState>();
  TextEditingController imgurlcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController valuecontroller = TextEditingController();

  late Map<String, dynamic> addToGame;

  addData() {
    addToGame = {
      'imgurl': imgurlcontroller.text,
      'name': namecontroller.text,
      'value': valuecontroller.text,


    }; //day2
    ref.add(addToGame).whenComplete(() => Navigator.pop(context));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body:  Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: [

                          TextFormField(
                            controller: imgurlcontroller,
                            decoration: InputDecoration(
                                labelText: 'imgurl',
                                hintText: 'Insert Image'),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            controller: namecontroller,
                            decoration: InputDecoration(
                                labelText: 'name',
                                hintText: 'Enter name'),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            controller: valuecontroller,
                            decoration: InputDecoration(
                                labelText: 'value',
                                hintText: 'Enter value'),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),



                          Container(
                            height: 40,
                            width: 100,
                            color: Colors.red,
                            child: TextButton(
                              onPressed: () {
                                addData();
                              },
                              child: Text(
                                'submit',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        ]
                    ),
                  )

              )
            ],
          )
      ),
    );
  }
}