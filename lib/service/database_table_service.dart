import 'package:astra_db_cmd/utils/astra_db_credentials.dart';
import 'package:http/http.dart' as http;

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
      {required astraDbId, required astraDbRegion, required keyspace}) async {
    AstraDbCredential astraDbCredential = AstraDbCredential(
      astraDbId: astraDbId,
      astraDbRegion: astraDbRegion,
      keyspace: keyspace,
    );

    http.Response response = await http.get(
      getBaseUrl(
        scheme: 'https://',
        host:
            '${astraDbCredential.astraDbId}-${astraDbCredential.astraDbRegion}.apps.astra.datastax.com',
        path: '/rest/v1/${astraDbCredential.keyspace}/tables',
      ),
    );
  }
}
