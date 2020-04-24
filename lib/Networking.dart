import 'package:http/http.dart';
import 'dart:convert';

class Networking {
  String _token = '137e3b14cdf47a1f193b1bffe40c5774f6d2f0e6';
  String url = 'https://owlbot.info/api/v4/dictionary/';

  Future<List<Map>> getData(String word) async {
    Response response =
        await get(url + word, headers: {'Authorization': 'Token ' + _token});

    if (response.statusCode == 200) {
      try {
        String data = response.body;
        List<Map> definitions = [];

        for (var i = 0; i < jsonDecode(data)['definitions'].length; i++) {
          var defAll = {
            'type': jsonDecode(data)['definitions'][i]['type'],
            'def': jsonDecode(data)['definitions'][i]['definition'],
            'ex': jsonDecode(data)['definitions'][i]['example'],
            'img': jsonDecode(data)['definitions'][i]['image_url']
          };
          definitions.add(defAll);
        }
        //print(definitions);
        return definitions;
      } catch (e) {
        print(e);
      }
    } else {
      print(response.statusCode);
      //print('Word not found in Database');
    }
  }
}
