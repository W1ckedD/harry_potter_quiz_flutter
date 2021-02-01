import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  final bool selected;
  final bool isCorrect;
  final String choiceText;
  final Function onPressed;
  Choice({this.isCorrect, this.selected, this.choiceText, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(5),
        color: isCorrect
            ? Colors.green
            : selected
                ? Colors.white
                : Colors.transparent,
      ),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
          onPressed: onPressed,
          child: Text(
            choiceText,
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
            ),
          )),
    );
  }
}
