import 'dart:convert';

import 'package:colorize/colorize.dart';
import 'package:http/http.dart' as http;

abstract class RequestHandler {
  static requestResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        return 'BAD REQUEST';
      case 404:
        return 'RESOURCE NOT FOUND';
      case 403:
        return 'FORBIDDEN!';
      case 401:
        return 'UNAUTHORIZED ACCESS';
      case 500:
        return 'SERVER ERROR';
      case 503:
        return 'SERVICE NOT AVAILABLE';
      default:
        throw response;
    }
  }
}

class AstraCustomErrorHandler {
  const AstraCustomErrorHandler(this.customText);
  final String customText;
  Colorize get getErrorMessage => Colorize(customText);
  static Colorize get socketErrorMessage =>
      Colorize("Network error! Kindly connect to the internet and try again.");
}
