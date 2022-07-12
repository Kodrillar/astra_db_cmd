import 'package:colorize/colorize.dart';

enum MessageText {
  welcome,
  checkTables,
  checkKeyspace,
}

class AstraCommandlineTextCustomizer {
  const AstraCommandlineTextCustomizer(this.customText);
  final String customText;
  Colorize get getCustomText => Colorize(customText);
}

final customText = <MessageText, Colorize>{
  MessageText.welcome:
      AstraCommandlineTextCustomizer("Welcome to Astra_db_cmd!🙂️\n")
          .getCustomText
          .blue()
          .bold(),
  MessageText.checkTables:
      AstraCommandlineTextCustomizer('Check tables [c]').getCustomText.yellow(),
  MessageText.checkKeyspace:
      AstraCommandlineTextCustomizer('Check keyspace [ck]')
          .getCustomText
          .green(),
};

class AstraCommandlineText {
  static Colorize getCustomText(MessageText messageText) =>
      customText[messageText]!;
}
