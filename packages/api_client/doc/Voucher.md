# maki_api_client.model.Voucher

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**voucherId** | **String** |  | 
**code** | **String** |  | 
**name** | **String** |  | 
**type** | [**VoucherType**](VoucherType.md) |  | 
**value** | **int** |  | 
**maxDiscount** | **int** |  | 
**minSpend** | **int** |  | 
**quota** | **int** |  | 
**usedCount** | **int** | The uses taken; a void gives its sale's back. | 
**startAt** | [**DateTime**](DateTime.md) |  | 
**expiredAt** | [**DateTime**](DateTime.md) |  | 
**allOutlets** | **bool** |  | 
**outlets** | [**List&lt;VoucherOutlet&gt;**](VoucherOutlet.md) | The outlets it is for, by name, none when it is for all of them. Deleted outlets sell nothing and don't show; an outlet's Manager sees only theirs.  | 
**isActive** | **bool** |  | 
**status** | [**VoucherStatus**](VoucherStatus.md) |  | 
**firstUsedAt** | [**DateTime**](DateTime.md) | When a sale first used it, voided since or not; from then on PUT keeps its code and type, and it can't be deleted. | 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


