import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import '../../data/version1/data.dart';
import 'IEventLogClientV1.dart';

class EventLogNullClientV1 implements IEventLogClientV1
{
	@override
	Future<DataPage<SystemEventV1>> getEvents(String correlationId, FilterParams filter, PagingParams paging) async 
	{
		return await Future.value(DataPage<SystemEventV1>([], 0));
	}

	@override
	Future<SystemEventV1> logEvent(String correlationId, SystemEventV1 event) async 
	{
		 return await Future.value(SystemEventV1());
	}
}
