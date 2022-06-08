import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/question_model.dart';


class QuizProvider extends ChangeNotifier{

  late int _total,_attempted,_notAttempted,_incorrect,_correct;

  late List<QuestionModel> _questions;
  late List<String> _optionsSelected;
  late int totalPrice;
  List<QuestionModel> get questions => _questions;

  get incorrect => _incorrect;

  set incorrect(value) {
    _incorrect = value;
  }

  set questions(List<QuestionModel> value) {
    _questions = value;
    _optionsSelected = List.generate(value.length, (index) => "");
    _total = 0;
    _attempted =0;
    _notAttempted=value.length;
    _incorrect=0;
    _correct = 0;

    notifyListeners();
  }

  setOptionSelected(String option,int index){
    _optionsSelected[index]=option;
    _questions[index].answered = true;
    notifyListeners();
  }



  //List of selectedOptions
  //["Cat","Ball","","",""]

  //List of questions
  //[QuestionMode,QuestionModel,QuestionModel]
  int getCorrectCount(){
    _correct=0;
    for(int i=0;i<_questions.length;i++){
      if(_questions[i].correctOption == _optionsSelected[i]){
        _correct++;
      }
    }
    return _correct;
  }

  int getInCorrectCount(){
    _incorrect=0;
    for(int i=0;i<_questions.length;i++){
      if( _optionsSelected[i].isNotEmpty && _questions[i].correctOption != _optionsSelected[i]){
        _incorrect++;
      }
    }
    return _incorrect;
  }

  int getNotAttemptedCount(){
    _notAttempted=0;
    for(int i=0;i<_optionsSelected.length;i++){
      if( _optionsSelected[i].isEmpty){
        _notAttempted++;
      }
    }
    return _notAttempted;
  }

  int getAttemptedCount(){
    _notAttempted=0;
    for(int i=0;i<_optionsSelected.length;i++){
      if( _optionsSelected[i].isNotEmpty){
        _attempted++;
      }
    }
    return _attempted;
  }


  QuestionModel getQuestionModelFromDatasnapshot(
      DocumentSnapshot questionSnapshot) {
    Map<String, dynamic> data = questionSnapshot.data() as Map<String, dynamic>;
    QuestionModel questionModel = new QuestionModel.fromJson(data);
    questionModel.question = data["question"];
    questionModel.answered = false;
    return questionModel;
  }

  List<String> get optionsSelected => _optionsSelected;

  set optionsSelected(List<String> value) {

    _optionsSelected = value;
  }
}

