import 'dart:io';

import 'package:astra_db_cmd/service/database_table_service.dart';
import 'package:colorize/colorize.dart';


void main(List<String> arguments) {
  Future<void> getDatabaseTable(
      {required astraDbId,
      required astraDbRegion,
      required keyspace,
      required astraDbToken}) async {
    try {
      final tableData = await DatabaseTableService.getDatabaseTable(
        astraDbId: astraDbId,
        astraDbRegion: astraDbRegion,
        keyspace: keyspace,
        astraDbToken: astraDbToken,
      );
      print(tableData);
    } on SocketException {
      print(errorMessage.red().bold());
    } catch (ex) {
      print(errorMessage.red().bold());
    }
  }

  Colorize welcomeMessage = Colorize('Welcome to Astra_db_cmd!🙂️\n');
  Colorize option1 = Colorize('Check tables [c]');
  Colorize option2 = Colorize('Check keyspace [ck]');
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
    getDatabaseTable(
      astraDbId: astraDbId,
      astraDbRegion: astraDbRegion,
      keyspace: keyspace,
      astraDbToken: astraDbToken,
    );
  }
}
