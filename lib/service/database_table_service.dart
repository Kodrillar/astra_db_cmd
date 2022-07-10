import 'dart:convert';

import 'package:astra_db_cmd/utils/astra_db_credentials.dart';
import 'package:colorize/colorize.dart';
import 'package:http/http.dart' as http;

Colorize errorMessage =
    Colorize('Network error! Kindly connect to the internet and try again.');

class DatabaseTableService {
  Uri getBaseUrl({
    required scheme,
    required host,
    required path,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: path,
      );
  Future<dynamic> getDatabaseTable(
      {required astraDbId,
      required astraDbRegion,
      required keyspace,
      required astraDbToken}) async {
    AstraDbCredential astraDbCredential = AstraDbCredential(
        astraDbId: astraDbId,
        astraDbRegion: astraDbRegion,
        keyspace: keyspace,
        astraDbToken: astraDbToken);

    http.Response response = await http.get(
        getBaseUrl(
          scheme: 'https',
          host:
              '${astraDbCredential.astraDbId}-${astraDbCredential.astraDbRegion}.apps.astra.datastax.com',
          path: '/rest/v1/${astraDbCredential.keyspace}/tables',
        ),
        headers: {
          'x-cassandra-token': astraDbCredential.astraDbToken,
        });

    try {
      var responseBody = requestResponse(response);
      return responseBody;
    } on http.Response catch (response) {
      return jsonDecode(response.body);
    }
  }

  requestResponse(http.Response response) {
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
