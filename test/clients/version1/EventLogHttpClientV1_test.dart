import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:test/test.dart';
import 'package:pip_clients_eventlog/pip_clients_eventlog.dart';

import 'EventLogClientV1Fixture.dart';

var httpConfig = ConfigParams.fromTuples([
  'connection.protocol',
  'http',
  'connection.host',
  'localhost',
  'connection.port',
  8080
]);

void main() {
  group('EventLogHttpClientV1', () {
    EventLogHttpClientV1 _client;
    EventLogClientV1Fixture _fixture;

    setUp(() async {
      _client = EventLogHttpClientV1();
      _client.configure(httpConfig);

      _fixture = EventLogClientV1Fixture(_client);
      await _client.open(null);
    });

    tearDown(() async {
      _client.close(null);
    });

    test('CRUD Operations', () async {
      await _fixture.testCrudOperations();
    });
  });
}
