import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'tglib.dart';
import 'DataBase.dart';

void main() async {
  //var DB = File('tac_database_June2022.csv');
  //var listOfDb = csvToList(DB);
  var response;
  var imeis = IMEIS();
  var phones = PHONES();
  var url = Uri.https('api.telegram.org',
      'bot5592263581:AAG4ngT4rwb4iVB2VMij6P7FCNWoyjYuvio/getUpdates');
  int STOP = 1;
  int updCount = 0;
  var ifFirst = true;
  int updCountPrev = 0;
  try {
    while (STOP != 0) {
      response = await http.get(url);
      response = json.decode(response.body);
      if (response != null) {
        Map result = <Map, String>{};
        if (ifFirst) {
          int i = 0;
          while (response["result"][i].toString() !=
              response["result"].last.toString()) {
            i++;
          }
          updCount = i;
          updCountPrev = updCount - 1;
        } else {
          int i = 0;
          while (response["result"][i].toString() !=
              response["result"].last.toString()) {
            i++;
          }
          if (i > updCount) {
            updCount++;
          }
        }
        var lastUpd = response["result"][updCount]["message"];
        if (updCount != updCountPrev) {
          var inp = lastUpd["text"];
          var message = FinderV2(imeis, phones, inp);
          var gLink;
          if (message ==
              "Слишком много попыток,бро\nПоробуй еще раз, мб ошибся где...") {
            gLink = "";
          } else {
            gLink = spaceDel(message);
          }
          var chatId = lastUpd["chat"]["id"];
          var url = Uri.https(
              'api.telegram.org',
              '/bot5592263581:AAG4ngT4rwb4iVB2VMij6P7FCNWoyjYuvio/sendMessage',
              {'chat_id': '$chatId', 'text': '$message\n\n$gLink'});
          http.post(url);
          updCountPrev++;
        }

        ifFirst = false;
        //sleep(Duration(seconds: 3));
      }
    }
  } catch (e) {
    var url = Uri.https(
        'api.telegram.org',
        '/bot5592263581:AAG4ngT4rwb4iVB2VMij6P7FCNWoyjYuvio/sendMessage',
        {'chat_id': '444062880', 'text': 'ошибак $e'});
    http.post(url);
  }
}
