# maki_api_client.model.OutletInput

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | 2 to 10 letters and digits; stored in upper case. | 
**name** | **String** |  | 
**address** | **String** |  | [optional] 
**phone** | **String** |  | [optional] 
**timezone** | **String** | IANA name; `Asia/Jakarta` when left out. | [optional] 
**locale** | **String** | `id` when left out. | [optional] 
**openTime** | **String** | `HH:MM`, with `close_time`, or both left out. | [optional] 
**closeTime** | **String** |  | [optional] 
**taxPct** | **num** |  | [optional] [default to 0]
**servicePct** | **num** |  | [optional] [default to 0]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


