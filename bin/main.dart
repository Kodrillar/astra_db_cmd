import 'dart:io';
import 'lib/utils/astra_cmd_text.dart';

import 'lib/astra_implement.dart';

void main(List<String> arguments) {
  final welcomeText = AstraCommandlineText.getCustomText(MessageText.welcome);
  final checkTablesText =
      AstraCommandlineText.getCustomText(MessageText.checkTables);
  final checkKeyspaceText =
      AstraCommandlineText.getCustomText(MessageText.checkKeyspace);
  stdout.write(
    '\n$welcomeText\n$checkTablesText\n$checkKeyspaceText\n\nwhat would you like to do? ',
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
