import 'package:flutter/material.dart';
import 'package:harry_potter_quiz/widgets/pagination.dart';
import 'package:harry_potter_quiz/widgets/question.dart';
import 'package:harry_potter_quiz/questions.dart';

class QuizScreen extends StatefulWidget {
  createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List pages = List.generate(questions.length,
      (index) => ({'pageIndex': index, 'choiceSelected': false}));
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            _showAlertDialog(context).then((value) {
              if (value) {
                reset();
                Navigator.pop(context);
              }
            });
          },
        ),
        title: Text('Harry Potter Quiz'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.dstATop,
          ),
          fit: BoxFit.fill,
          image: AssetImage('assets/wp.jpg'),
        )),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                child: Pagination(
                  pages: pages,
                  currentPage: currentPage,
                  onPressed: (int idx) {
                    setState(() {
                      currentPage = idx;
                    });
                  },
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
              ),
            ),
            Flexible(
              flex: 10,
              child: Question(
                question: questions[currentPage],
                selectedChoice: questions[currentPage]['selectedChoice'],
                select: (int idx) {
                  questions[currentPage]['selectedChoice'] = idx;
                  setState(() {
                    pages[currentPage]['choiceSelected'] = true;
                  });
                },
                deselect: () {
                  questions[currentPage]['selectedChoice'] = -1;
                  setState(() {
                    pages[currentPage]['choiceSelected'] = false;
                  });
                },
                next: () {
                  setState(() {
                    currentPage++;
                  });
                },
                previous: () {
                  setState(() {
                    currentPage--;
                  });
                },
                index: currentPage == questions.length - 1 ? -1 : currentPage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _showAlertDialog(context) async => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exit Quiz?'),
          content: Text(
              'All none saved data will be lost.\nAre you sure you want to quit?'),
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
