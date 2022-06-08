import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  Stream getQuestionData() {
    return FirebaseFirestore.instance.collection("QNA").snapshots();
  }
}