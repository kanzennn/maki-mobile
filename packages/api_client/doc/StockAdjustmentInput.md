# maki_api_client.model.StockAdjustmentInput

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | `in` adds, `out` takes away, `set` is a stock take: the count found. | 
**qty** | **int** | The amount to add or take away (at least 1), or the count found. | 
**reason** | **String** | `damaged` is damaged or spoiled; `other` says what in `note`. | 
**note** | **String** | Required for the reason `other`. Shown as typed, never translated. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


