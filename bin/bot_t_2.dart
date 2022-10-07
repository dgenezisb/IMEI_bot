import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'tglib.dart';
import 'DataBase.dart';

String upd = "";
String updPr = "";
var ifFirst = true;
List updData = [];
int lastUpdInt = 0;
var ifOK = false;
int itr = 0;
String updToNull = "";
void main() async {
  //var DB = File('tac_database_June2022.csv');
  //r listOfDb = csvToList(DB);
  var response;
  var insCount = 0;
  var imeis = IMEIS();
  var phones = PHONES();
  List<String> log = [];
  var url = Uri.https('api.telegram.org',
      '/bot5729343686:AAGYrJnZ-jH6gWfMgui2ip88ejCjRZftKEA/getUpdates');
  int STOP = 1;
  int updCount = 0;
  //var ifFirst = true;
  int updCountPrev = 0;
  try {
    while (STOP != 0) {
      loop:
      if (log.length > 500) {
        log.removeAt(0);
      }

      response = await http.get(url);
      response = json.decode(response.body);
      var NowTime = DateTime.now();
      //log.add("-->принял данные с апи $NowTime\n\n");
      if ((response != null) && (response["result"] != null)) {
        var i = response["result"].length;
        if (((response["result"].length == 0)) && ifFirst == false) {
          ifFirst = true;
          var ds = DateTime.now();
          updToNull = "Произошло отчищение массива апдейтов в $ds";
        }
        if (response["result"].length != 0) {
          if (ifFirst) {
            int i = 0;
            while (response["result"][i].toString() !=
                response["result"].last.toString()) {
              i++;
            }
            updCount = i;
            updCountPrev = updCount - 1;
            updData.add(response["result"].last["update_id"].toString());
            updData.add(
                response["result"].last["message"]["message_id"].toString());
            updData.add(response["result"].last["message"]["date"]);
            itr = response["result"].length - 1;
            lastUpdInt = i;
            log.add("-->Заполнил первую дату апдейтов $NowTime\n\n");
          } else {
            int i = 0;
            while (response["result"][i].toString() !=
                response["result"].last.toString()) {
              i++;
            }
            if (i > updCount) {
              updCount++;
            }
            lastUpdInt = updCount;
            //log.add("-->пока все ок...");
          }
          //проверка по данным апдейта

          var lastUpd = response["result"][updCount]["message"];
          //var lastUpd = response["result"][itr]["message"];
          if (ifFirst) {
            upd = lastUpd['message_id'].toString();
          } else {
            updPr = upd;
            upd = lastUpd['message_id'].toString();
          }

          if (updData.isNotEmpty) {
            if ((updData[0] !=
                    response["result"][updCount]["update_id"].toString()) &&
                (updData[1] !=
                    response["result"][updCount]["message"]["message_id"]
                        .toString()) &&
                updData[2] != response["result"][updCount]["message"]["date"]) {
              updData[0] = response["result"][updCount]["update_id"].toString();
              updData[1] = response["result"][updCount]["message"]["message_id"]
                  .toString();
              updData[2] = response["result"][updCount]["message"]["date"];
              ifOK = true;
              var id = response["result"][updCount]["message_id"];
              itr++;
              log.add(
                  "-->проверка по данным апдейта прошла успешно\n$NowTime\nupdate_id = $id");
            } else {
              ifOK = false;
              if (ifFirst) {
                ifOK = true;
                itr++;
              }
            }
          }

          if ((upd != updPr) && (ifOK == true)) {
            if (updCount != updCountPrev) {
              log.add("-->попал в цикл обрпботки данных $NowTime\n\n");
              var inp = lastUpd["text"];
              var altInp = inp;
              inp = Format(inp);

              ////
              if ((inp[0] == "1") ||
                  (inp[0] == "2") ||
                  (inp[0] == "3") ||
                  (inp[0] == "4") ||
                  (inp[0] == "5") ||
                  (inp[0] == "6") ||
                  (inp[0] == "7") ||
                  (inp[0] == "8") ||
                  (inp[0] == "9") ||
                  (inp[0] == "0")) {
                var message = FinderV2(imeis, phones, inp);
                var gLink;
                if (message ==
                    "Слишком много попыток,бро\nПоробуй еще раз, мб ошибся где...") {
                  gLink = "";
                } else {
                  gLink = "https://www.google.com/search?q=" +
                      message.replaceAll(RegExp(" "), "");
                }
                var chatId = lastUpd["chat"]["id"];
                var url = Uri.https(
                    'api.telegram.org',
                    '/bot5729343686:AAGYrJnZ-jH6gWfMgui2ip88ejCjRZftKEA/sendMessage',
                    {'chat_id': '$chatId', 'text': '$message\n\n$gLink'});
                log.add("-->высрал ответ\n$NowTime\n\n");
                http.post(url);
                updCountPrev++;
              } else {
                if (inp == "logs") {
                  var url = Uri.https(
                      'api.telegram.org',
                      '/bot5729343686:AAGYrJnZ-jH6gWfMgui2ip88ejCjRZftKEA/sendMessage',
                      {
                        'chat_id': '444062880',
                        'text':
                            '$updToNull\nСписок найденых по запросу  IMEI\n\n$log'
                      });
                  http.post(url);
                } else {
                  var gLink;
                  var message = FindAll(altInp);
                  if (message ==
                      "Слишком много попыток,бро\nПоробуй еще раз, мб ошибся где...") {
                    //gLink = "";
                  } else {
                    //gLink = spaceDel(message);
                  }
                  var chatId = lastUpd["chat"]["id"];
                  var url = Uri.https(
                      'api.telegram.org',
                      '/bot5729343686:AAGYrJnZ-jH6gWfMgui2ip88ejCjRZftKEA/sendMessage',
                      {
                        'chat_id': '$chatId',
                        'text': 'Список найденых по запросу  IMEI\n\n$message'
                      });
                  http.post(url);
                  log.add("-->высрал ответ\n$NowTime\n\n");
                }
                updCountPrev++;
              }
            }
          }
          ifFirst = false;
        }

        //sleep(Duration(seconds: 3));
      }
    }
  } catch (e) {
    var url = Uri.https('api.telegram.org',
        '/bot5729343686:AAGYrJnZ-jH6gWfMgui2ip88ejCjRZftKEA/sendMessage', {
      'chat_id': '444062880',
      'text':
          'ошибак $e\n\nПоследнее отчищение $updToNull\n\nкаунтер апдейта $lastUpdInt\nлог всего говна\n$log'
    });
    http.post(url);

    //updCount = updCount - 1;
    //main();
  }
}
