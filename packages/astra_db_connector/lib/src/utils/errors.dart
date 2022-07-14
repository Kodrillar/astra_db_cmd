import 'package:colorize/colorize.dart';

class AstraCustomErrorHandler {
  const AstraCustomErrorHandler(this.customText);
  final String customText;
  Colorize get getErrorMessage => Colorize(customText);
  static Colorize get socketErrorMessage =>
      Colorize("Network error! Kindly connect to the internet and try again.");
}
