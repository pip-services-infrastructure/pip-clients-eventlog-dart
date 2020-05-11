import 'package:pip_clients_eventlog/pip_clients_eventlog.dart';
import 'package:test/test.dart';

import '../../data/TestModel.dart';

class EventLogClientV1Fixture {
  SystemEventV1 EVENT1 = TestModel.createSystemEvent();
  SystemEventV1 EVENT2 = TestModel.createSystemEvent();

  IEventLogClientV1 _client;

  EventLogClientV1Fixture(IEventLogClientV1 client) {
    expect(client, isNotNull);
    _client = client;
  }

  void testCrudOperations() async {
    // Create one event
    var event = await this._client.logEvent(null, EVENT1);

    TestModel.assertEqual(EVENT1, event);

    // Create another event
    event = await this._client.logEvent(null, EVENT2);

    TestModel.assertEqual(EVENT2, event);

    // Get all system events
    var page = await this._client.getEvents(null, null, null);

    expect(page, isNotNull);

    //Assert.Single(page.Data);
    expect(page.data.length, 2);
  }
}
