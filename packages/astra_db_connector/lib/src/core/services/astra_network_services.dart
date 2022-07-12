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

  static dynamic getTablesFromDb(AstraDbCredential astraDbCredential) async {
    try {
      http.Response response = await http.get(
          getBaseUrl(
            scheme: 'https',
            host:
                '${astraDbCredential.astraDbId}-${astraDbCredential.astraDbRegion}.apps.astra.datastax.com',
            path: '/api/rest/v2/keyspaces/${astraDbCredential.keyspace}/tables',
          ),
          headers: {
            'x-cassandra-token': astraDbCredential.astraDbToken,
          });
      var responseBody = RequestHandler.requestResponse(response);
      return responseBody;
    } on http.Response catch (response) {
      return jsonDecode(response.body);
    }
  }
}
