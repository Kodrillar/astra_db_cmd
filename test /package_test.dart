//to test http requests
import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:astra_db_connector/emit_services.dart';

void main(List<String> args) {
  setUp(() {});

//testing response method in packages/astra_db_connector/lib/src/utils/request_handlers.dart

  test("testing response message ", () {
    var response = http.Response.bytes([1, 2], 401);
    var packageResponse = RequestHandler.requestResponse(response);
    expect(packageResponse, "UNAUTHORIZED ACCESS");
  });
}
