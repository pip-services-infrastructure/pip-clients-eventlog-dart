import 'package:pip_clients_eventlog/src/version1/version1.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';

class EventLogClientFactory extends Factory
{
	static final NullClientDescriptor = Descriptor('pip-services-eventlog', 'client', 'null', '*', '1.0');
	static final HttpClientDescriptor = Descriptor('pip-services-eventlog', 'client', 'http', '*', '1.0');

	EventLogClientFactory()
		: super()
	{
		registerAsType(EventLogClientFactory.NullClientDescriptor, EventLogNullClientV1);
		registerAsType(EventLogClientFactory.HttpClientDescriptor, EventLogHttpClientV1);
	}
}
