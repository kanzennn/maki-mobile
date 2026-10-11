# maki_api_client.api.TableApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancelTableSchedule**](TableApi.md#canceltableschedule) | **DELETE** /api/v1/outlets/{oid}/table-schedules/{sid} | Cancel a schedule
[**createArea**](TableApi.md#createarea) | **POST** /api/v1/outlets/{oid}/areas | Create an area
[**createTable**](TableApi.md#createtable) | **POST** /api/v1/outlets/{oid}/tables | Create a table
[**createTableSchedule**](TableApi.md#createtableschedule) | **POST** /api/v1/outlets/{oid}/table-schedules | Take tables out of service for a time
[**deleteArea**](TableApi.md#deletearea) | **DELETE** /api/v1/outlets/{oid}/areas/{aid} | Delete an area
[**deleteTable**](TableApi.md#deletetable) | **DELETE** /api/v1/outlets/{oid}/tables/{tid} | Delete a table
[**getArea**](TableApi.md#getarea) | **GET** /api/v1/outlets/{oid}/areas/{aid} | One area
[**getDineInMode**](TableApi.md#getdineinmode) | **GET** /api/v1/outlets/{oid}/dine-in-mode | How the outlet seats its dine-in customers
[**getLayout**](TableApi.md#getlayout) | **GET** /api/v1/outlets/{oid}/areas/{aid}/layout | An area&#39;s layout
[**getPosTables**](TableApi.md#getpostables) | **GET** /api/v1/outlets/{oid}/pos/tables | The cashier&#39;s floor
[**getTable**](TableApi.md#gettable) | **GET** /api/v1/outlets/{oid}/tables/{tid} | One table
[**getTableSchedule**](TableApi.md#gettableschedule) | **GET** /api/v1/outlets/{oid}/table-schedules/{sid} | One schedule
[**listAreas**](TableApi.md#listareas) | **GET** /api/v1/outlets/{oid}/areas | The outlet&#39;s dining areas
[**listTableSchedules**](TableApi.md#listtableschedules) | **GET** /api/v1/outlets/{oid}/table-schedules | The outlet&#39;s table schedules
[**listTables**](TableApi.md#listtables) | **GET** /api/v1/outlets/{oid}/tables | The outlet&#39;s tables
[**releaseTable**](TableApi.md#releasetable) | **POST** /api/v1/outlets/{oid}/tables/{tid}/release | Release a table its customers have left
[**reorderAreas**](TableApi.md#reorderareas) | **PUT** /api/v1/outlets/{oid}/areas/order | Put the areas in a new order
[**saveLayout**](TableApi.md#savelayout) | **PUT** /api/v1/outlets/{oid}/areas/{aid}/layout | Save an area&#39;s whole layout
[**setDineInMode**](TableApi.md#setdineinmode) | **PUT** /api/v1/outlets/{oid}/dine-in-mode | Choose how the outlet seats its dine-in customers
[**setTableStatus**](TableApi.md#settablestatus) | **PATCH** /api/v1/outlets/{oid}/tables/{tid}/status | Turn a table on or off at the cashier
[**updateArea**](TableApi.md#updatearea) | **PUT** /api/v1/outlets/{oid}/areas/{aid} | Rename an area
[**updateTable**](TableApi.md#updatetable) | **PUT** /api/v1/outlets/{oid}/tables/{tid} | Change a table
[**updateTableSchedule**](TableApi.md#updatetableschedule) | **PUT** /api/v1/outlets/{oid}/table-schedules/{sid} | Change a schedule


# **cancelTableSchedule**
> cancelTableSchedule(oid, sid)

Cancel a schedule

Needs `table.manage`, and a schedule that isn't over. Its tables are back in service; it stays as a record, with who cancelled it. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String sid = sid_example; // String | 

try {
    api.cancelTableSchedule(oid, sid);
} on DioException catch (e) {
    print('Exception when calling TableApi->cancelTableSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **sid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createArea**
> Area createArea(oid, areaInput)

Create an area

Needs `table.manage`. It goes last in the order, with an empty canvas.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final AreaInput areaInput = ; // AreaInput | 

try {
    final response = api.createArea(oid, areaInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->createArea: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **areaInput** | [**AreaInput**](AreaInput.md)|  | 

### Return type

[**Area**](Area.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createTable**
> Table createTable(oid, tableInput)

Create a table

Needs `table.manage`. It isn't placed on its area's layout yet; the area's layout version moves on. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final TableInput tableInput = ; // TableInput | 

try {
    final response = api.createTable(oid, tableInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->createTable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **tableInput** | [**TableInput**](TableInput.md)|  | 

### Return type

[**Table**](Table.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createTableSchedule**
> Schedule createTableSchedule(oid, scheduleInput)

Take tables out of service for a time

Needs `table.manage`. Its tables are `scheduled` from its start until its end. One that overlaps another schedule at a table is a warning (409 `schedule_overlaps`) until it is sent with `confirm_overlap`. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final ScheduleInput scheduleInput = ; // ScheduleInput | 

try {
    final response = api.createTableSchedule(oid, scheduleInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->createTableSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **scheduleInput** | [**ScheduleInput**](ScheduleInput.md)|  | 

### Return type

[**Schedule**](Schedule.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteArea**
> deleteArea(oid, aid)

Delete an area

Needs `table.manage`. Only an area that holds no table, deleted ones aside; its canvas goes with it, and its name is free again. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String aid = aid_example; // String | 

try {
    api.deleteArea(oid, aid);
} on DioException catch (e) {
    print('Exception when calling TableApi->deleteArea: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **aid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteTable**
> deleteTable(oid, tid)

Delete a table

Needs `table.manage`. Only a table nobody is seated at; a sale at it under way finishes first, and counts. Its name is free again. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String tid = tid_example; // String | 

try {
    api.deleteTable(oid, tid);
} on DioException catch (e) {
    print('Exception when calling TableApi->deleteTable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **tid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getArea**
> Area getArea(oid, aid)

One area

Needs `table.view`.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String aid = aid_example; // String | 

try {
    final response = api.getArea(oid, aid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->getArea: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **aid** | **String**|  | 

### Return type

[**Area**](Area.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDineInMode**
> DineInModeSetting getDineInMode(oid)

How the outlet seats its dine-in customers

Needs `table.view`; the Owner reads any outlet's. The cashier reads it in the catalog (`dine_in_mode`). 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 

try {
    final response = api.getDineInMode(oid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->getDineInMode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 

### Return type

[**DineInModeSetting**](DineInModeSetting.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLayout**
> Layout getLayout(oid, aid)

An area's layout

Needs `table.view`. Its decorations, and its tables with their statuses now, placed or not. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String aid = aid_example; // String | 

try {
    final response = api.getLayout(oid, aid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->getLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **aid** | **String**|  | 

### Return type

[**Layout**](Layout.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPosTables**
> Floor getPosTables(oid)

The cashier's floor

Needs `checkout.create`. The outlet's areas that hold tables, in order, with their decorations, and their tables with their statuses now; the cashier picks a table from it, and releases one. Where the outlet seats its customers by number stands (`dine_in_mode` `number`), `areas` is empty: there is no table to pick. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 

try {
    final response = api.getPosTables(oid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->getPosTables: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 

### Return type

[**Floor**](Floor.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTable**
> Table getTable(oid, tid)

One table

Needs `table.view`.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String tid = tid_example; // String | 

try {
    final response = api.getTable(oid, tid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->getTable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **tid** | **String**|  | 

### Return type

[**Table**](Table.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTableSchedule**
> Schedule getTableSchedule(oid, sid)

One schedule

Needs `table.view`.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String sid = sid_example; // String | 

try {
    final response = api.getTableSchedule(oid, sid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->getTableSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **sid** | **String**|  | 

### Return type

[**Schedule**](Schedule.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listAreas**
> AreaList listAreas(oid, page, pageSize)

The outlet's dining areas

Needs `table.view`. In their order (`sort_order`, then the name); deleted areas never show. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listAreas(oid, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->listAreas: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**AreaList**](AreaList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTableSchedules**
> ScheduleList listTableSchedules(oid, status, page, pageSize)

The outlet's table schedules

Needs `table.view`. The latest first, past ones and cancelled ones included.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final ScheduleStatus status = ; // ScheduleStatus | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listTableSchedules(oid, status, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->listTableSchedules: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **status** | [**ScheduleStatus**](.md)|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**ScheduleList**](ScheduleList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listTables**
> TableList listTables(oid, areaId, status, q, page, pageSize)

The outlet's tables

Needs `table.view`. By area, in the areas' order, then by name as people read numbers (\"Meja 2\" before \"Meja 10\"), with their statuses now. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String areaId = areaId_example; // String | One area's tables.
final TableStatus status = ; // TableStatus | 
final String q = q_example; // String | Part of the name, in any case.
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listTables(oid, areaId, status, q, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->listTables: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **areaId** | **String**| One area's tables. | [optional] 
 **status** | [**TableStatus**](.md)|  | [optional] 
 **q** | **String**| Part of the name, in any case. | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**TableList**](TableList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **releaseTable**
> Table releaseTable(oid, tid)

Release a table its customers have left

Needs `checkout.create`. The sales before it no longer seat anyone there; a sale at it under way finishes first, and is released too. A table nobody is seated at stays as it is, and records nothing. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String tid = tid_example; // String | 

try {
    final response = api.releaseTable(oid, tid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->releaseTable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **tid** | **String**|  | 

### Return type

[**Table**](Table.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reorderAreas**
> reorderAreas(oid, areaOrderRequest)

Put the areas in a new order

Needs `table.manage`. `area_ids` lists every area of the outlet, each once, in the new order. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final AreaOrderRequest areaOrderRequest = ; // AreaOrderRequest | 

try {
    api.reorderAreas(oid, areaOrderRequest);
} on DioException catch (e) {
    print('Exception when calling TableApi->reorderAreas: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **areaOrderRequest** | [**AreaOrderRequest**](AreaOrderRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **saveLayout**
> Layout saveLayout(oid, aid, layoutInput)

Save an area's whole layout

Needs `table.manage`. The editor saves the whole layout at once: the tables in `tables` placed in their boxes, the area's others off the layout, and its decorations. It saves on the version it opened; the layout as it is records nothing and keeps its version. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String aid = aid_example; // String | 
final LayoutInput layoutInput = ; // LayoutInput | 

try {
    final response = api.saveLayout(oid, aid, layoutInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->saveLayout: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **aid** | **String**|  | 
 **layoutInput** | [**LayoutInput**](LayoutInput.md)|  | 

### Return type

[**Layout**](Layout.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setDineInMode**
> DineInModeSetting setDineInMode(oid, dineInModeSetting)

Choose how the outlet seats its dine-in customers

Needs `table.manage`. It holds from the outlet's next sale on: a sale under way finishes first, under the mode it began with. The orders taken keep their tables or their stands, and the areas and tables stay, for the table mode again. Saving the mode the outlet has changes and records nothing; a change is `dine_in_mode.updated` in the Log Action, with what it was. `mode` is `required` and `oneof`. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final DineInModeSetting dineInModeSetting = ; // DineInModeSetting | 

try {
    final response = api.setDineInMode(oid, dineInModeSetting);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->setDineInMode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **dineInModeSetting** | [**DineInModeSetting**](DineInModeSetting.md)|  | 

### Return type

[**DineInModeSetting**](DineInModeSetting.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setTableStatus**
> Table setTableStatus(oid, tid, activeRequest)

Turn a table on or off at the cashier

Needs `table.manage`. It stays on its layout either way; a table customers are seated at stays occupied until it is released. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String tid = tid_example; // String | 
final ActiveRequest activeRequest = ; // ActiveRequest | 

try {
    final response = api.setTableStatus(oid, tid, activeRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->setTableStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **tid** | **String**|  | 
 **activeRequest** | [**ActiveRequest**](ActiveRequest.md)|  | 

### Return type

[**Table**](Table.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateArea**
> Area updateArea(oid, aid, areaInput)

Rename an area

Needs `table.manage`. A name as it is records nothing.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String aid = aid_example; // String | 
final AreaInput areaInput = ; // AreaInput | 

try {
    final response = api.updateArea(oid, aid, areaInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->updateArea: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **aid** | **String**|  | 
 **areaInput** | [**AreaInput**](AreaInput.md)|  | 

### Return type

[**Area**](Area.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTable**
> Table updateTable(oid, tid, tableInput)

Change a table

Needs `table.manage`. A table moved to another area leaves its place on the old one's layout; both layouts' versions move on. A change of nothing records nothing. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String tid = tid_example; // String | 
final TableInput tableInput = ; // TableInput | 

try {
    final response = api.updateTable(oid, tid, tableInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->updateTable: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **tid** | **String**|  | 
 **tableInput** | [**TableInput**](TableInput.md)|  | 

### Return type

[**Table**](Table.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateTableSchedule**
> Schedule updateTableSchedule(oid, sid, scheduleInput)

Change a schedule

Needs `table.manage`, and a schedule that isn't over. One under way keeps the start it has, past or not; overlaps are as for a new one. A change of nothing records nothing. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getTableApi();
final String oid = oid_example; // String | 
final String sid = sid_example; // String | 
final ScheduleInput scheduleInput = ; // ScheduleInput | 

try {
    final response = api.updateTableSchedule(oid, sid, scheduleInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TableApi->updateTableSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **sid** | **String**|  | 
 **scheduleInput** | [**ScheduleInput**](ScheduleInput.md)|  | 

### Return type

[**Schedule**](Schedule.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

