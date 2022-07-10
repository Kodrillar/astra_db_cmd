import 'dart:io';

import 'package:colorize/colorize.dart';

void main(List<String> arguments) {
  Colorize welcomeMessage = Colorize('Welcome to Astra_db_cmd!🙂️\n');
  Colorize option1 = Colorize('Check tables [c]');
  Colorize option2 = Colorize('Check keyspace [ck]');
  stdout.write(
    '\n${welcomeMessage.blue().bold()}\n${option1.yellow().bold()}\n${option2.cyan()}\n\nwhat would you like to do? ',
  );
  final line = stdin.readLineSync();
}
