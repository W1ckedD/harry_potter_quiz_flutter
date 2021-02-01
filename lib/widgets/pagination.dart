import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {
  final List pages;
  final int currentPage;
  final Function onPressed;
  Pagination({this.pages, this.currentPage, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 10,
      children: pages.map(
        (page) {
          int index = pages.indexOf(page);
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: page['pageIndex'] == currentPage
                    ? Colors.white
                    : page['choiceSelected']
                        ? Color.fromRGBO(46, 45, 59, 1)
                        : Colors.transparent,
                border:
                    page['pageIndex'] == currentPage || page['choiceSelected']
                        ? Border.all(width: 0)
                        : Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(5)),
            child: InkWell(
              onTap: () {
                onPressed(index);
              },
              child: Center(
                child: Text(
                  '${page['pageIndex'] + 1}',
                  style: TextStyle(
                    color: page['pageIndex'] == currentPage
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
