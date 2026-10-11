# maki_api_client.model.Me

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**userId** | **String** |  | 
**username** | **String** |  | 
**name** | **String** |  | 
**email** | **String** |  | 
**emailVerified** | **bool** |  | 
**pendingEmail** | **String** | An address waiting to be confirmed, after `PUT /me/email`. | 
**locale** | **String** | The user's own language choice; `null` follows the outlet. | 
**language** | **String** | The language the user sees, after the fallbacks (own choice, outlet, `id`). | 
**isOwner** | **bool** |  | 
**isManager** | **bool** |  | 
**outletId** | **String** | `null` for the Owner. | 
**mustChangePassword** | **bool** |  | 
**permissions** | **List&lt;String&gt;** | What the user may do, sorted: in their outlet, or for the Owner in any outlet. Clients show what these allow; the server checks them on every request regardless. | 
**outlet** | [**OutletSummary**](OutletSummary.md) | The user's outlet; `null` for the Owner. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


