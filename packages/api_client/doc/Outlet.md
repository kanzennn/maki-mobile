# maki_api_client.model.Outlet

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**outletId** | **String** |  | 
**code** | **String** | Upper-case letters and digits, printed in receipt numbers. | 
**name** | **String** |  | 
**address** | **String** |  | 
**phone** | **String** |  | 
**timezone** | **String** | IANA name. Every time of the outlet shows in this zone. | 
**locale** | **String** | The default language, for receipts and users who haven't chosen one. | 
**openTime** | **String** | `HH:MM`; `null` together with `close_time` when no hours are set. | 
**closeTime** | **String** | `HH:MM`. Before `open_time` means past midnight. | 
**taxPct** | **num** | Percentage, at most two decimals. | 
**servicePct** | **num** |  | 
**status** | **String** |  | 
**managers** | [**List&lt;ManagerRef&gt;**](ManagerRef.md) |  | 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


