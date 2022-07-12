import 'package:astra_db_connector/src/core/services/astra_network_services.dart';
import 'package:astra_db_connector/src/model/astra_db_credentials_model.dart';

class DatabaseTableService {
  AstraDbCredential dbCredential;
  DatabaseTableService(this.dbCredential);

  //register your astra database services here
  Future<dynamic> getDatabaseTable() async {
    dynamic dbNetworkResponse =
        AstraDbNetworkServices.getTablesFromDb(dbCredential);
    return dbNetworkResponse;
  }
}
