# maki_api_client.model.CreateOrderPayment

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**method** | [**PaymentMethod**](PaymentMethod.md) |  | 
**received** | **int** | Cash, what the customer handed over, at least the total; the other methods have none. | [optional] 
**reference** | **String** | Debit, and only debit: the retrieval reference or approval code on the EDC machine's slip, 4 to 32 letters, digits and hyphens, in any case. Never a card's number, which is refused (`payment.reference`: `card_number`). The field's other rules are `required`, `format` and, on another method, `not_allowed`.  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


