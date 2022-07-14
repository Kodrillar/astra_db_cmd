import 'package:astra_db_connector/src/core/services/astra_network_services.dart';
import 'package:astra_db_connector/src/model/astra_db_credentials_model.dart';

class DatabaseTableService {
  DatabaseTableService(this.dbCredential);
  AstraDbCredential dbCredential;

  //register your astra database services here
  Future<dynamic> getDatabaseTables() async {
    dynamic dbNetworkResponse =
        AstraDbNetworkServices.getTablesFromDb(dbCredential);
    return dbNetworkResponse;
  }

  Future<dynamic> getDatabaseKeyspaces() async {
    dynamic keyspaceResponse =
        AstraDbNetworkServices.getKeyspacesFromDb(dbCredential);
    return keyspaceResponse;
  }
}
