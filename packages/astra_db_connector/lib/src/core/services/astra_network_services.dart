import 'dart:convert';
import 'package:astra_db_connector/src/model/astra_db_credentials_model.dart';
import 'package:astra_db_connector/src/utils/request_handlers.dart';
import 'package:http/http.dart' as http;

abstract class AstraDbNetworkServices {
  static Uri getBaseUrl({
    required scheme,
    required host,
    required path,
  }) =>
      Uri(
        scheme: scheme,
        host: host,
        path: path,
      );

  static getUriHost(String astraDbId, String astraDbRegion) =>
      '$astraDbId-$astraDbRegion.apps.astra.datastax.com';

  static dynamic getTablesFromDb(AstraDbCredential astraDbCredential) async {
    http.Response response = await http.get(
        getBaseUrl(
          scheme: 'https',
          host: getUriHost(
            astraDbCredential.astraDbId,
            astraDbCredential.astraDbRegion,
          ),
          path: '/api/rest/v1/keyspaces/${astraDbCredential.keyspace}/tables',
        ),
        headers: {
          'x-cassandra-token': astraDbCredential.astraDbToken,
        });
    try {
      var responseBody = RequestHandler.requestResponse(response);
      return responseBody;
    } on http.Response catch (response) {
      return jsonDecode(response.body);
    }
  }

  static Future<dynamic> getKeyspacesFromDb(
      AstraDbCredential astraDbCredential) async {
    http.Response response = await http.get(
      getBaseUrl(
        scheme: 'https',
        host: getUriHost(
          astraDbCredential.astraDbId,
          astraDbCredential.astraDbRegion,
        ),
        path: '/api/rest/v2/schemas/keyspaces',
      ),
      headers: {
        'x-cassandra-token': astraDbCredential.astraDbToken,
      },
    );

    try {
      var responseBody = RequestHandler.requestResponse(response);
      return responseBody;
    } on http.Response catch (res) {
      return jsonDecode(res.body);
    }
  }
}
