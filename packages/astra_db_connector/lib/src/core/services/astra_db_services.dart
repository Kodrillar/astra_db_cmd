import 'package:astra_db_connector/src/core/services/astra_network_services.dart';
import 'package:astra_db_connector/src/model/astra_db_credentials_model.dart';
//you get register your astra database services here while making use of the dbCredentials rules

class DatabaseTablePackageService {
  AstraDbPackageCredential dbCredential;
  DatabaseTablePackageService(this.dbCredential);

  //register your astra database services here
  Future<dynamic> getDatabaseTable() async {
    dynamic dbNetworkResponse =
        AstraDbNetworkservices.getTableCredentialsFromDb(dbCredential);
    return dbNetworkResponse;
  }
}
