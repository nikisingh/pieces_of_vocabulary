import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Text(
          'Oops, Word not found in Dictionary!!',
          style: TextStyle(
              fontFamily: 'SourceSansPro',
              fontSize: 20.0,
              color: Colors.brown,
              //fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
