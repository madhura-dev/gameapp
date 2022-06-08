
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gameapp/Admin/AdminDashboard.dart';
import 'package:gameapp/provider/quiz_provider.dart';
import 'package:provider/provider.dart';

import 'SelectionScreen/selectionScreen.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>QuizProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'GameApp',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
        ),
        home: SelectionScreen(),
        //home: DashBoard(),
      ),
    );
  }
}
