import 'dart:io';
import 'package:astra_db_connector/astra_db_connector.dart';

Future<void> yourDatabaseImplementation(
    {required astraDbId,
    required astraDbRegion,
    required keyspace,
    required astraDbToken}) async {
  try {
    AstraDbCredential astraDbCredential = AstraDbCredential(
        astraDbId: astraDbId,
        astraDbRegion: astraDbRegion,
        keyspace: keyspace,
        astraDbToken: astraDbToken);
    final tableData =
        await DatabaseTableService(astraDbCredential).getDatabaseTable();
    print(tableData);
  } on SocketException {
    print(AstraCustomErrorHandler.socketErrorMessage.red().bold());
  } catch (ex) {
    print(AstraCustomErrorHandler(ex.toString()).getErrorMessage.red().bold());
  }
}
