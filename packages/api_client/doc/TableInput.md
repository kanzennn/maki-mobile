# maki_api_client.model.TableInput

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** |  | 
**areaId** | **String** | A table moved to another area leaves its place on the old one's layout. | 
**capacity** | **int** |  | [optional] 
**shape** | [**TableShape**](TableShape.md) |  | [optional] 
**isActive** | **bool** | For a new table, active when left out; an existing one changes it with `PATCH …/status`. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


