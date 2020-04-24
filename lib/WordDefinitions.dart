import 'package:flutter/material.dart';
import 'Constants.dart';

class WordDefinition extends StatefulWidget {
  final String text;
  final List<Map> wordDefinition;
  WordDefinition({@required this.text, this.wordDefinition});

  @override
  _WordDefinitionState createState() => _WordDefinitionState();
}

class _WordDefinitionState extends State<WordDefinition> {
  @override
  Widget build(BuildContext context) {
    //print(widget.wordDefinition);
    // print(widget.wordDefinition.length);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(widget.text),
        ),
        body: getWordPageBody(context));
  }

  getWordPageBody(BuildContext context) {
    return ListView.builder(
      itemCount: widget.wordDefinition.length,
      itemBuilder: (BuildContext context, int i) {
        return Card(
          elevation: 5.0,
          color: Colors.black,
          child: Column(
            children: <Widget>[
              ListTile(
                trailing: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    widget.wordDefinition[i]['img'] != null
                        ? widget.wordDefinition[i]['img']
                        : '',
                    fit: BoxFit.fill,
                  ),
                ),
                title: Text(
                  widget.wordDefinition[i]['type'] != null
                      ? widget.wordDefinition[i]['type']
                      : '',
                  style: kCardTextStyle,
                ),
                subtitle: Column(
                  children: <Widget>[
                    Text(
                      (widget.wordDefinition[i]['def']) != null
                          ? (widget.wordDefinition[i]['def'])
                          : '',
                      style: kCardSubTextStyle,
                    ),
                    Divider(
                      color: Colors.brown,
                    ),
                    Text(
                      (widget.wordDefinition[i]['ex']) != null
                          ? (widget.wordDefinition[i]['ex'])
                          : '',
                      style: kCardSubtitleTextStyle,
                    ),
                  ],
                ),
                isThreeLine: true,
              )
            ],
          ),
        );
      },
    );
  }
}
