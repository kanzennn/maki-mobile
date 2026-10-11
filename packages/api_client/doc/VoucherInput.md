# maki_api_client.model.VoucherInput

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | 3–20 letters and digits, kept in capitals; unique among the vouchers not deleted. | 
**name** | **String** |  | [optional] 
**type** | [**VoucherType**](VoucherType.md) |  | 
**value** | **int** | Basis points for a percentage (1–10000), rupiah for an amount (1–1,000,000,000). | 
**maxDiscount** | **int** | A percentage's most, in rupiah; dropped for an amount. | [optional] 
**minSpend** | **int** | The subtotal the voucher needs, in rupiah. | [optional] 
**quota** | **int** | How many sales may use it, in every outlet together. | 
**startAt** | [**DateTime**](DateTime.md) | When it starts, to the second; null starts at once. | [optional] 
**expiredAt** | [**DateTime**](DateTime.md) | When it stops, to the second; after `start_at`. | 
**allOutlets** | **bool** | Every outlet, those still to come too; else the ones in `outlet_ids`. | 
**outletIds** | **List&lt;String&gt;** | The outlets it is for when it isn't for all of them; ignored when it is. | [optional] 
**isActive** | **bool** | A new voucher's status, active when left out; ignored by PUT. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


