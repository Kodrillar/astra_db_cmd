import 'dart:io';
import 'package:astra_db_connector/emit_services.dart';

Future<void> yourDatabaseImplementation(
    {required astraDbId,
    required astraDbRegion,
    required keyspace,
    required astraDbToken}) async {
  try {
    AstraDbPackageCredential astraDbCredential = AstraDbPackageCredential(
        astraDbId: astraDbId,
        astraDbRegion: astraDbRegion,
        keyspace: keyspace,
        astraDbToken: astraDbToken);
    final tableData =
        await DatabaseTablePackageService(astraDbCredential).getDatabaseTable();
    print(tableData);
  } on SocketException {
    print(AstraPackageCustormErrorHandler.erroMessage.red().bold());
  } catch (ex) {
    print(AstraPackageCustormErrorHandler.erroMessage.red().bold());
  }
}
