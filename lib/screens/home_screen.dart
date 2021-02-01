import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harry Potter Quiz'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/bg.png'),
          ),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 80),
          child: FlatButton(
              color: Colors.transparent,
              child: Text(
                'Start The Quiz',
                style: TextStyle(fontSize: 30),
              ),
              onPressed: () => Navigator.pushNamed(context, '/quiz')),
        ),
      ),
    );
  }
}
