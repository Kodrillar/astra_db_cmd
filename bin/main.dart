import 'dart:io';
import 'package:astra_db_connector/emit_services.dart';

import 'lib/astra_implement.dart';

void main(List<String> arguments) {
  var welcomeMessage =
      AstraPackageCustormErrorHandler("Welcome to Astra_db_cmd!🙂️\n")
          .getAstraPackageCustomizer;
  var option1 = AstraPackageCustormErrorHandler('Check tables [c]')
      .getAstraPackageCustomizer;
  var option2 = AstraPackageCustormErrorHandler('Check keyspace [ck]')
      .getAstraPackageCustomizer;
  stdout.write(
    '\n${welcomeMessage.blue().bold()}\n${option1.yellow().bold()}\n${option2.cyan()}\n\nwhat would you like to do? ',
  );

  final line = stdin.readLineSync();
  if (line == 'c') {
    stdout.write('Input your AstraDB ID: ');
    final astraDbId = stdin.readLineSync();
    stdout.write('Input your AstraDB Region: ');
    final astraDbRegion = stdin.readLineSync();
    stdout.write('Input your AstraDB Token: ');
    final astraDbToken = stdin.readLineSync();
    stdout.write('Input your Keyspace: ');
    final keyspace = stdin.readLineSync();
    yourDatabaseImplementation(
        astraDbId: astraDbId,
        astraDbRegion: astraDbRegion,
        keyspace: keyspace,
        astraDbToken: astraDbToken);
  }
}
