import 'package:csv/csv.dart' as csv;
import 'dart:io';

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
  inp = "\n\nhttps://www.google.com/search?q=$inp2";
  return inp;
}
