import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class QuizData extends StatefulWidget {
  QuizData({Key? key}) : super(key: key);

  @override
  _QuizDataState createState() => _QuizDataState();
}

class _QuizDataState extends State<QuizData> {
  final ref = FirebaseFirestore.instance.collection("QNA");
  final _formKey = GlobalKey<FormState>();
  TextEditingController imgurlcontroller = TextEditingController();
  TextEditingController option1controller = TextEditingController();
  TextEditingController option2controller = TextEditingController();
  TextEditingController option3controller = TextEditingController();
  TextEditingController option4controller = TextEditingController();
  TextEditingController questioncontroller = TextEditingController();
  late Map<String, dynamic> addToQuiz;

  addData() {
    addToQuiz = {
      'imgurl': imgurlcontroller.text,
      'option1': option1controller.text,
      'option2': option2controller.text,
      'option3': option3controller.text,
      'option4': option4controller.text,
      'question': questioncontroller.text,

    }; //day2
    ref.add(addToQuiz).whenComplete(() => Navigator.pop(context));
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
                            controller: option1controller,
                            decoration: InputDecoration(
                                labelText: 'option1',
                                hintText: 'Enter option1'),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            controller: option2controller,
                            decoration: InputDecoration(
                                labelText: 'option2',
                                hintText: 'Enter option2'),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            controller: option3controller,
                            decoration: InputDecoration(
                                labelText: 'option3',
                                hintText: 'Enter option3'),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            controller: option4controller,
                            decoration: InputDecoration(
                                labelText: 'option4',
                                hintText: 'Enter option4'),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),

                          TextFormField(
                            controller: questioncontroller,
                            decoration: InputDecoration(
                                labelText: 'question',
                                hintText: 'Enter question'),
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