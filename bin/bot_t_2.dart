/*import 'dart:io';

//import 'package:teledart/model.dart';
//import 'package:teledart/model.dart';
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
//import 'package:faker/faker.dart' as faker;
import 'package:csv/csv.dart' as csv;

void main() async {
  //погнали
  var BOT_TOKEN = '5494373728:AAG_hHzjOVsdqd66L3tP8aLDUVjWA4vePO0';
  final username = (await Telegram(BOT_TOKEN).getMe()).username;
  var teledart = TeleDart(BOT_TOKEN, Event(username!));
  //подрубаем бдшку
  //File DB = new File("DB.csv");
  var DB = File('tac_database_June2022.csv');
  //list generate
  var listOfDb = csvToList(DB);
  //var file = File('tac_database_June2022.csv');
  /*var file = File('tac_database_June2022.csv');
  var listFirst = file.readAsStringSync();
  List<String> IMEIs = [];
  List<String> Names = [];
  int count = 0;
  int countofCommas = 0;
  int action = 1;
  while (count != listFirst.length) {
    action = 0;
    if ((listFirst[count] == ",") && (countofCommas == 0)) {
      if (count < 9) {
        IMEIs.add(listFirst.substring(0, count));
      } else {
        int retCount = count;
        while (listFirst[retCount] != ",") {
          retCount--;
        }
        IMEIs.add(listFirst.substring(retCount, count));
      }
      countofCommas++;
      action = 1;
    }
    if ((listFirst[count] == ",") && (countofCommas == 1) && (action == 0)) {
      countofCommas++;
      action = 1;
    }
    if ((listFirst[count] == ",") && (countofCommas == 2) && (action == 0)) {
      int retCount = count;
      while (listFirst[retCount] != ",") {
        retCount--;
      }
      Names.add(listFirst.substring(retCount + 1, count));
      countofCommas = 0;
      action = 1;
    }
    count++;
  }*/
  teledart.start();

  //var text = teledart.

  teledart.onCommand("start").listen((event) {
    var name = event.chat.first_name;
    event.reply(
        "Привет,$name!\nПросто веди IMEI!\n\nЕСЛИ БОТ НЕ ОТВЕЧАЕТ, ДОБАВЬ К IMEI БУКВУ В КОНЦЕ\n\nЕсть вопросы по работе или увидел баги?? - /help\nСвязь с разрабом - /dev");
  });
  teledart.onCommand("help").listen((event) {
    event.reply(
        "Если после ввода IMEI бот ничего не выдал,то попробуй добаить букву после самого IMEI");
  });
  teledart.onCommand("dev").listen((event) {
    event.reply(
        "https://t.me/GraphiteRay - это я)\nЕсли что-то тупит и\\или не работает сразу пиши");
  });
  //основа i 35264311057165
  var ready = 1;

  teledart.onMessage().listen((event) {
    var test = event.toString();
    event.reply(test);
  });
  teledart.onMessage(keyword: 'U').listen((event) {
    var test = event.text.toString();
    event.reply(test);
  });
  teledart.onMessage(keyword: '1').listen((event) {
    //ниже тыбзим текст
    var text = event.text.toString();
    var inside = text;
    var res = Finder(listOfDb, inside);
    res = spaceDel(res);
    event.reply(res);
  });
  teledart.onMessage(keyword: '2').listen((event) {
    //ниже тыбзим текст
    if (ready == 1) {
      ready = 0;
      var text = event.text.toString();
      var inside = text;
      var res = Finder(listOfDb, inside);
      res = spaceDel(res);
      event.reply(res);
    }
  });
  teledart.onMessage(keyword: '3').listen((event) {
    //ниже тыбзим текст
    if (ready == 1) {
      ready = 0;
      var text = event.text.toString();
      var inside = text;
      var res = Finder(listOfDb, inside);
      res = spaceDel(res);
      event.reply(res);
    }
  });
  teledart.onMessage(keyword: '4').listen((event) {
    //ниже тыбзим текст
    if (ready == 1) {
      ready = 0;
      var text = event.text.toString();
      var inside = text;
      var res = Finder(listOfDb, inside);
      res = spaceDel(res);
      event.reply(res);
    }
  });
  teledart.onMessage(keyword: '5').listen((event) {
    //ниже тыбзим текст
    if (ready == 1) {
      ready = 0;
      var text = event.text.toString();
      var inside = text;
      var res = Finder(listOfDb, inside);
      res = spaceDel(res);
      event.reply(res);
    }
  });
  teledart.onMessage(keyword: '6').listen((event) {
    //ниже тыбзим текст
    if (ready == 1) {
      ready = 0;
      var text = event.text.toString();
      var inside = text;
      var res = Finder(listOfDb, inside);
      res = spaceDel(res);
      event.reply(res);
    }
  });
  teledart.onMessage(keyword: '7').listen((event) {
    //ниже тыбзим текст
    if (ready == 1) {
      ready = 0;
      var text = event.text.toString();
      var inside = text;
      var res = Finder(listOfDb, inside);
      res = spaceDel(res);
      event.reply(res);
    }
  });
  teledart.onMessage(keyword: '8').listen((event) {
    //ниже тыбзим текст
    if (ready == 1) {
      ready = 0;
      var text = event.text.toString();
      var inside = text;
      var res = Finder(listOfDb, inside);
      res = spaceDel(res);
      event.reply(res);
    }
  });
  teledart.onMessage(keyword: '9').listen((event) {
    //ниже тыбзим текст
    if (ready == 1) {
      ready = 0;
      var text = event.text.toString();
      var inside = text;
      var res = Finder(listOfDb, inside);
      res = spaceDel(res);
      event.reply(res);
    }
  });
  teledart.onMessage(keyword: '0').listen((event) {
    //ниже тыбзим текст
    if (ready == 1) {
      ready = 0;
      var text = event.text.toString();
      var inside = text;
      var res = Finder(listOfDb, inside);

      res = spaceDel(res);
      event.reply(res);
    }
  });
  /*teledart.onMessage(entityType: "c").listen((event) {
    var ss = event.text;
  });
  teledart.onMessage().listen((event) {
    if ((event.text![0] == "1") ||
        (event.text![0] == "2") ||
        (event.text![0] == "3") ||
        (event.text![0] == "4") ||
        (event.text![0] == "5") ||
        (event.text![0] == "6") ||
        (event.text![0] == "7") ||
        (event.text![0] == "8") ||
        (event.text![0] == "9") ||
        (event.text![0] == "0")) {
      var text = event.text.toString();
      var inside = text.substring(2);
      var res = Finder(listOfDb, inside);
      event.reply(res);
    } else {
      teledart.sendMessage(event.chat.id, "я не знаю что это,сорри");
    }
  });*/
}

List<List> csvToList(File DB) {
  csv.CsvToListConverter c =
      new csv.CsvToListConverter(eol: "\r\n", fieldDelimiter: ",");
  List<List> ListCreated = c.convert(DB.readAsStringSync());
  return ListCreated;
}

String Finder(List<List> DBList, String inside) {
  String result = "Empty";
  //var a = DBList[0];
  int i = 0;
  int iDubl = 0;
  int check = 0;
  int chCount = 0;
  while (check != 1) {
    while ((DBList[i][0].toString() != inside) && (i != 215207)) {
      i++;
    }
    if (DBList[i][0].toString() == inside) {
      check = 1;
      iDubl = i;
    }

    inside = rezak(inside);
    i = 0;
    chCount++;
    if (chCount > 25) {
      result = "Слишком много попыток,бро\nПоробуй еще раз, мб ошибся где...";
      break;
    }
  }
  if ((iDubl != 215207) && (check == 1)) {
    result = DBList[iDubl][2];
  }
  return result;
}

String rezak(String inside) {
  if (inside.length != 0) {
    int l = inside.length - 1;
    inside = inside.substring(0, l);
    return inside;
  } else {
    return "";
  }
}

String spaceDel(String inp) {
  //inp = inp.trim();
  var inp2;
  inp2 = inp.replaceAll(RegExp(" "), "");
  inp = inp + "\n\nhttps://www.google.com/search?q=$inp2";
  return inp;
}*/
//import 'package:teledart/model.dart';
import 'dart:io';

import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'tglib.dart';

//https://api.telegram.org/bot5494373728:AAG_hHzjOVsdqd66L3tP8aLDUVjWA4vePO0/sendMessage?chat_id=444062880&text=TEST

void main() async {
  var DB = File('tac_database_June2022.csv');
  var listOfDb = csvToList(DB);
  var response;
  var url = Uri.https('api.telegram.org',
      'bot5592263581:AAG4ngT4rwb4iVB2VMij6P7FCNWoyjYuvio/getUpdates');
  int STOP = 1;
  int updCount = 0;
  var ifFirst = true;
  int updCountPrev = 0;
  while (STOP != 0) {
    response = await http.post(url);
    response = json.decode(response.body);
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
      var message = Finder(listOfDb, inp);
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

    Map chatInfo = <String, dynamic>{};
    chatInfo = lastUpd["chat"];
    var textInfo = lastUpd["text"].toString();
    chatInfo.update("type", (value) => textInfo);
    ifFirst = false;
  }
  /*var chatId = AA["id"];
  var message = AA[type];
  var response;
  var url = Uri.https(
      'api.telegram.org',
      '/bot5494373728:AAG_hHzjOVsdqd66L3tP8aLDUVjWA4vePO0/sendMessage',
      {'chat_id': '$chatId', 'text': '$message'});
  response = http.post(url);*/
}

Future getUpdate() async {
  var response;
  var url = Uri.https('api.telegram.org',
      'bot5494373728:AAG_hHzjOVsdqd66L3tP8aLDUVjWA4vePO0/getUpdates');
  response = await http.post(url);
  response = json.decode(response.body);
  Map result = <Map, String>{};
  var lastUpd = response["result"].last["message"];
  Map chatInfo = <String, dynamic>{};
  chatInfo = lastUpd["chat"];
  var textInfo = lastUpd["text"].toString();
  chatInfo.update("type", (value) => textInfo);
  return chatInfo;
}

String DBans(String IMEI) {
  var response;

  return response;
}
