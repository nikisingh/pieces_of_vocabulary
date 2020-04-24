import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'Networking.dart';
import 'NotFound.dart';
import 'WordDefinitions.dart';

void main() => runApp(HomePage());

//TODO - Handle html tags of definition and example - Investment and Sanitizer words returning tags.
//TODO - handle image exception
//TODO - Add Mnemonic , Mark word as favorites

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: kAppBarText,
        ),
        body: DoubleBackToCloseApp(
          child: HomePage1(),
          snackBar: const SnackBar(
            content: Text('Tap back again to exit'),
          ),
        ),
      ),
    );
  }
}

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  String getTextFieldData() {
    return myController.text;
  }

  @override
  Widget build(BuildContext context) {
    Networking networking = Networking();

    void getAppData() async {
      var appData = await networking.getData(getTextFieldData());

      if (appData != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => WordDefinition(
              text: getTextFieldData(),
              wordDefinition: appData,
            ),
          ),
        );
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ErrorScreen()));
        myController.clear();
      }
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: TextField(
            style: TextStyle(color: Colors.white, fontSize: 20.0),
            cursorColor: Colors.white,
            textInputAction: TextInputAction.search,
            controller: myController,
            onEditingComplete: () {
              setState(() {
                getAppData();
              });
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.brown,
                ),
                onPressed: () {
                  setState(() {
                    getAppData();
                  });
                },
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors.brown, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors.white, style: BorderStyle.solid)),
              hintStyle: kSearchTextStyle,
              hintText: 'Enter a search term',
            ),
          ),
        ),
      ],
    );
  }
}
