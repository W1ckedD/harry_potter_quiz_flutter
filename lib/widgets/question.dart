import 'package:flutter/material.dart';
import 'package:harry_potter_quiz/widgets/question_choice.dart';

class Question extends StatefulWidget {
  final bool resultMode;
  final Map question;
  final int index;
  final Function next;
  final Function previous;
  final Function select;
  final Function deselect;
  int selectedChoice;
  Question(
      {this.index,
      this.resultMode = false,
      this.question,
      this.selectedChoice,
      this.select,
      this.deselect,
      this.next,
      this.previous});
  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question['question'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Choice(
            isCorrect:
                widget.resultMode && widget.question['correctAnswer'] == 0,
            selected: widget.selectedChoice == 0,
            choiceText: widget.question['choices'][0],
            onPressed: () {
              if (widget.resultMode) return;
              setState(() {
                widget.selectedChoice = 0;
              });
              widget.select(0);
            },
          ),
          Choice(
            isCorrect:
                widget.resultMode && widget.question['correctAnswer'] == 1,
            selected: widget.selectedChoice == 1,
            choiceText: widget.question['choices'][1],
            onPressed: () {
              if (widget.resultMode) return;
              setState(() {
                widget.selectedChoice = 1;
              });
              widget.select(1);
            },
          ),
          Choice(
            isCorrect:
                widget.resultMode && widget.question['correctAnswer'] == 2,
            selected: widget.selectedChoice == 2,
            choiceText: widget.question['choices'][2],
            onPressed: () {
              if (widget.resultMode) return;
              setState(() {
                widget.selectedChoice = 2;
              });
              widget.select(2);
            },
          ),
          Choice(
            isCorrect:
                widget.resultMode && widget.question['correctAnswer'] == 3,
            selected: widget.selectedChoice == 3,
            choiceText: widget.question['choices'][3],
            onPressed: () {
              if (widget.resultMode) return;
              setState(() {
                widget.selectedChoice = 3;
              });
              widget.select(3);
            },
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.index == 0
                  ? SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: FlatButton(
                        onPressed: widget.previous,
                        child: Text(
                          'Previous Question',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
              widget.index == -1
                  ? widget.resultMode
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: FlatButton(
                            onPressed: () {
                              _showAlertDialog(context).then((value) {
                                if (value) {
                                  Navigator.pushReplacementNamed(
                                      context, '/result');
                                }
                              });
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                      child: FlatButton(
                        onPressed: widget.next,
                        child: Text(
                          'Next Question',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }

  Future _showAlertDialog(context) async => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Submit your answers?'),
          content: Text(
              'Are You done with the quiz\n and ready to submit your answers?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
          ],
        );
      });
}
