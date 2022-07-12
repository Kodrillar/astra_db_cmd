import 'dart:io';
import 'package:astra_db_connector/astra_db_connector.dart';

class AstraCmdDataRepository {
  AstraCmdDataRepository(this.astraDbCredential);
  final AstraDbCredential astraDbCredential;

  void getAstraDbTable() {
    getAstraData<dynamic>(
      getDbData: () =>
          DatabaseTableService(astraDbCredential).getDatabaseTables(),
    );
  }

  void getAstraDbKeyspaces() {}

  Future<void> getAstraData<T>(
      {required Future<T> Function() getDbData}) async {
    try {
      final tableData = await getDbData();
      print(tableData);
    } on SocketException {
      print(AstraCustomErrorHandler.socketErrorMessage.red().bold());
    } catch (ex) {
      print(
          AstraCustomErrorHandler(ex.toString()).getErrorMessage.red().bold());
    }
  }
}
