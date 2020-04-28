import 'package:flutter/material.dart';
import 'Constants.dart';
import 'DataTransfromation.dart';

class WordDefinition extends StatefulWidget {
  final String text;
  final List<Map> wordDefinition;
  WordDefinition({@required this.text, this.wordDefinition});

  @override
  _WordDefinitionState createState() => _WordDefinitionState();
}

class _WordDefinitionState extends State<WordDefinition> {
  DataTransformation d = DataTransformation();

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
                      d.removeAllHtmlTags(widget.wordDefinition[i]['def']) !=
                              null
                          ? d.removeAllHtmlTags(widget.wordDefinition[i]['def'])
                          : '',
                      style: kCardSubTextStyle,
                    ),
                    Divider(
                      color: Colors.brown,
                    ),
                    Text(
                      d.removeAllHtmlTags(widget.wordDefinition[i]['ex']) !=
                              null
                          ? d.removeAllHtmlTags(widget.wordDefinition[i]['ex'])
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
