# maki_api_client.model.Schedule

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**scheduleId** | **String** |  | 
**title** | **String** |  | 
**startAt** | [**DateTime**](DateTime.md) |  | 
**endAt** | [**DateTime**](DateTime.md) |  | 
**status** | [**ScheduleStatus**](ScheduleStatus.md) |  | 
**tables** | [**List&lt;ScheduleTable&gt;**](ScheduleTable.md) | By area, then by name. | 
**createdBy** | [**UserRef**](UserRef.md) |  | 
**cancelledAt** | [**DateTime**](DateTime.md) |  | 
**cancelledBy** | [**UserRef**](UserRef.md) |  | 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


