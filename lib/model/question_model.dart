class QuestionModel{

  String? question;
  late String imgurl;
  late String option1;
  late String option2;
  late String option3;
  late String option4;
  late String correctOption;
  late bool answered;
  late List<String> shuffledOptions;



  QuestionModel({required this.question,required this.option1,required this.option2,
    required this.option3,required this.option4,required this.correctOption,required this.answered,required this.imgurl
  });

  QuestionModel.fromJson(Map<String , dynamic> json){
    imgurl= json['imgurl'];
    question= json['question'];
    option1 = json['option1'];
    option2= json['option2'];
    option3 = json['option3'];
    option4 = json['option4'];
    correctOption = json['option1'];
    shuffledOptions = [
      json["option1"],
      json["option2"],
      json["option3"],
      json["option4"],
    ];
    shuffledOptions.shuffle();
    answered = false;
  }
//
// Map<String , dynamic> toJson(){
//   final Map<String , dynamic> data = new Map<String , dynamic>();
//   data['question'] = this.question;
//   data[' option1'] = this. option1;
//   data['option2'] = this.option2;
//   data['option3'] = this.option3;
//   data['option4'] = this.option4;
//   data['correctOption'] = this.correctOption;
//   data[' answered'] = this. answered;
//   return data;
// }

}
