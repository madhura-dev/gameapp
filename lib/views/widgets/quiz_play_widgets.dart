import 'package:flutter/material.dart';
class OptionTile extends StatefulWidget {
  final String option, correctAnswer, optionSelected;
  final String sno;
  final bool disabled;

  OptionTile(
      { required this.correctAnswer, required this.option,  required this.optionSelected,required this.sno, required this.disabled});

  @override
  _OptionTileState createState() => _OptionTileState();
}

class _OptionTileState extends State<OptionTile> {


  Color decideColor(){
    if(widget.disabled && isCorrect()){
      return Colors.green;
    }else if(widget.disabled && !isCorrect()){
      return Colors.red;
    }else if(widget.disabled){
      return Colors.grey;
    }else
      return Colors.white;
  }

  bool isCorrect(){
    return  widget.optionSelected == widget.correctAnswer;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            height: 28,
            width: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                    color:  widget.optionSelected == widget.option?decideColor():Colors.white,
                    width: 1.5),
                color: widget.optionSelected == widget.option?decideColor():Colors.white,
                borderRadius: BorderRadius.circular(24)
            ),
            child: Text(
              widget.sno,
              style: TextStyle(
                color: widget.optionSelected == widget.option?Colors.white:Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Text(widget.option, style: TextStyle(
              fontSize: widget.optionSelected == widget.option? 22:17, color:  widget.optionSelected == widget.option?decideColor():Colors.black
          ),)
        ],
      ),
    );
  }
}


class NoOfQuestionTile extends StatefulWidget {
  final String text;
  final int number;

  NoOfQuestionTile({required this.text,  required this.number});

  @override
  _NoOfQuestionTileState createState() => _NoOfQuestionTileState();
}

class _NoOfQuestionTileState extends State<NoOfQuestionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14),
                    bottomLeft: Radius.circular(14)
                ),
                color: Colors.blue
            ),
            child: Text(
              "${widget.number}",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
                color: Colors.black54
            ),
            child: Text(
              widget.text,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}