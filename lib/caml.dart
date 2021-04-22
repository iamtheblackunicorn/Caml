/*
CAML by Alexander Abraham a.k.a. "The Black Unicorn".
licensed under the MIT License.
*/

import 'dart:io';
import 'dart:convert';
import 'package:clibu/clibu.dart';
import 'package:termstyle/termstyle.dart';

/// This method returns the data from a CAML
/// file as a Dart map!
Map<String, String> returnData(String camlString) {
  List<String> camlLines = camlString.split('\n');
  RegExp camlRegex = RegExp(r'\"(.*)\"\s\=\>\s\"(.*)\"');
  Map<String, String> result = {};
  for (int i = 0; i < camlLines.length; i++) {
    Map<String, List<String>> data =
        getPatterns('data', camlLines[i], camlRegex);
    if (data['data'] == null || data['data'].isEmpty) {
    } else {
      String key = data['data'][1];
      String value = data['data'][2];
      result.addAll({key: value});
    }
  }
  return result;
}

/// This method converts a Dart map
/// to a CAML data mapping.
String mapToCAML(Map<String, dynamic> userMap) {
  List<String> result = [];
  for (int i = 0; i < userMap.length; i++) {
    String key = userMap.keys.elementAt(i);
    String value = userMap[key].toString();
    result.add('"$key" => "$value"');
  }
  return result.join('\n').toString();
}

/// This method converts a CAML string to
/// a JSON string.
String camlToJSON(String camlString) {
  return json.encode(returnData(camlString));
}

/// This method converts a JSON string to
/// a CAML string.
String jsonToCAML(String jsonString) {
  Map<String, dynamic> jsonMap = json.decode(jsonString);
  return mapToCAML(jsonMap);
}

/// This method converts the data in a CAML file
/// to data in JSON format and writes the converted
/// data to a JSON file.
void convertCAMLToJSON(String filePath) {
  try {
    String camlString = File(filePath).readAsStringSync();
    String fileNameBase = filePath.split('.')[0];
    String newFileName = '$fileNameBase.json';
    File(newFileName).writeAsStringSync(camlToJSON(camlString));
  } catch (e) {
    printColoredString('$e', 'red');
  }
}

/// This method converts the data in a JSON file
/// to data in CAML format and writes the converted
/// data to a CAML file.
void convertJSONToCAML(String filePath) {
  try {
    String jsonString = File(filePath).readAsStringSync();
    String fileNameBase = filePath.split('.')[0];
    String newFileName = '$fileNameBase.caml';
    String resultString = jsonToCAML(jsonString);
    File(newFileName).writeAsStringSync(resultString);
  } catch (e) {
    printColoredString('$e', 'red');
  }
}

/// This class is the main class
/// for the CAML command-line utility.
class Caml extends CommandLineApp {
  @override
  String appName = 'CAML';
  @override
  String appVersion = '1.0';
  @override
  String appAuthor = 'The Black Unicorn';
  @override
  String appLicense = 'MIT license';
  @override
  Map<String, dynamic> argumentsDataBase = {};
}

/// This method runs the CAML command-line utility.
void runApp(List<String> arguments) {
  Caml camlApp = Caml();
  camlApp.addArgument('--toJSON', 'converts CAML to JSON', true);
  camlApp.addArgument('--toCAML', 'converts JSON to CAML', true);
  if (camlApp.argumentWasUsed(arguments, '--toJSON') == true) {
    convertCAMLToJSON(camlApp.getArgumentData(arguments, '--toJSON'));
  } else if (camlApp.argumentWasUsed(arguments, '--toCAML') == true) {
    convertJSONToCAML(camlApp.getArgumentData(arguments, '--toCAML'));
  }
  camlApp.runApp(arguments);
}
