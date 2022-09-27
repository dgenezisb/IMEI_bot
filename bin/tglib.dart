import 'package:csv/csv.dart' as csv;
import 'dart:io';
import 'DataBase.dart';
import 'package:path/path.dart';

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

String Format(String inp) {
  inp = inp.replaceAll(RegExp(" "), "");
  var inp2 = inp.split("/");
  inp = inp2[0].toLowerCase();
  return inp;
}

bool updCheck(var upd) {
  return true;
}

String FinderV3(List<String> IMEIS, List<String> PHONES, String inside) {
  var result;
  int i = 0;
  int iDubl = 0;
  int check = 0;
  int chCount = 0;
  while (check != 1) {
    while ((Format(PHONES[i].toString()) != inside) && (i < 215206)) {
      i++;
    }
    if (Format(PHONES[i].toString()) == inside) {
      check = 1;
      iDubl = i;
    }

    //inside = rezak(inside);
    i = 0;
    chCount++;
    if (chCount > 25) {
      result = "Слишком много попыток,бро\nПоробуй еще раз, мб ошибся где...";
      break;
    }
  }
  if ((iDubl < 215206) && (check == 1)) {
    result = IMEIS[iDubl];
  }
  return result;
}

String FindAll(String input) {
  List<String> output = [];
  var res = "";
  input = " " + input;
  var imeis = IMEIS();
  var phones = PHONES();
  List<int> nums = [];
  int i = 0;
  while (i < 215206) {
    if (phones[i].toString() == input) {
      int a = i;
      nums.add(a);
    }
    i++;
  }
  i = 0;

  if (nums != []) {
    while (i < nums.length) {
      String ans = imeis.elementAt(nums.elementAt(i)) + "\n";
      output.add(ans);
      i++;
    }
  } else {
    output.add("НИИ ЧаВо");
  }

  res = output.toString();
  res = res.replaceAll(RegExp("\\["), "");
  res = res.replaceAll(RegExp("]"), "");
  res = res.replaceAll(RegExp(","), "");
  return res;
}

String FinderV2(List<String> IMEIS, List<String> PHONES, String inside) {
  String result = "Empty";
  //var a = DBList[0];
  int i = 0;
  int iDubl = 0;
  int check = 0;
  int chCount = 0;
  while (check != 1) {
    while ((IMEIS[i].toString() != inside) && (i < 215206)) {
      i++;
    }
    if (IMEIS[i].toString() == inside) {
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
  if ((iDubl < 215206) && (check == 1)) {
    result = PHONES[iDubl];
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
  //inp = "\n\nhttps://www.google.com/search?q=$inp2";
  return inp;
}
