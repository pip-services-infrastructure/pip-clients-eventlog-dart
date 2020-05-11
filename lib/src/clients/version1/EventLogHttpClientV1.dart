import 'dart:async';
import 'dart:convert';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';
import '../../../pip_clients_eventlog.dart';


class EventLogHttpClientV1 extends CommandableHttpClient implements IEventLogClientV1
{
	EventLogHttpClientV1([config])
		: super('v1/eventlog')
	{
		if (config != null)
		{
			configure(ConfigParams.fromValue(config));
		};
	}

	@override
	Future<DataPage<SystemEventV1>> getEvents(String correlationId, FilterParams filter, PagingParams paging) async {
	    var result = await callCommand(
	      'get_events',
	      correlationId,
	      { 
	        'filter': filter, 
	        'paging': paging
	      }
	    );
	    return DataPage<SystemEventV1>.fromJson(json.decode(result), (item) {
	        var system_event = SystemEventV1();
	        system_event.fromJson(item);
	        return system_event;
	    });
	}

	@override
	Future<SystemEventV1> logEvent(String correlationId, SystemEventV1 event) async {
	    var result = await callCommand(
	        'log_event', correlationId, { 'event': event});
	    if (result == null) return null;
	    var item = SystemEventV1();
	    item.fromJson(json.decode(result));
	    return item;
	}
}
