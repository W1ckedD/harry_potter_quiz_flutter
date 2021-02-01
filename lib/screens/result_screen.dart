import 'package:flutter/material.dart';
import 'package:harry_potter_quiz/widgets/pagination.dart';
import 'package:harry_potter_quiz/widgets/question.dart';
import 'package:harry_potter_quiz/questions.dart';

class ResultScreen extends StatefulWidget {
  createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List pages = List.generate(questions.length,
      (index) => ({'pageIndex': index, 'choiceSelected': false}));
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final int selectedChoice = questions[currentPage]['selectedChoice'] ==
            questions[currentPage]['correctAnswer']
        ? 1
        : questions[currentPage]['selectedChoice'] == -1
            ? -1
            : 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
          onPressed: () {
            reset();
            Navigator.pop(context);
          },
        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  selectedChoice == 1
                      ? 'Correct'
                      : selectedChoice == 0
                          ? 'Wrong'
                          : 'No answer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: selectedChoice == 1
                        ? Colors.green
                        : selectedChoice == 0
                            ? Colors.red
                            : Colors.white,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  selectedChoice == 1
                      ? Icons.check
                      : selectedChoice == 0
                          ? Icons.close
                          : Icons.check_box_outline_blank,
                  color: selectedChoice == 1
                      ? Colors.green
                      : selectedChoice == 0
                          ? Colors.red
                          : Colors.white,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            Flexible(
              flex: 10,
              child: Question(
                resultMode: true,
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
}
