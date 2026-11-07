# maki_api_client.model.Dashboard

## Load the model package
```dart
import 'package:maki_api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**from** | [**DateTime**](DateTime.md) |  | 
**to** | [**DateTime**](DateTime.md) |  | 
**previousFrom** | [**DateTime**](DateTime.md) |  | 
**previousTo** | [**DateTime**](DateTime.md) |  | 
**summary** | [**DashboardSummary**](DashboardSummary.md) |  | 
**days** | [**List&lt;DashboardDaysInner&gt;**](DashboardDaysInner.md) | Every day of the period, those without a sale too. | 
**hours** | [**List&lt;DashboardHoursInner&gt;**](DashboardHoursInner.md) | An outlet's, every hour of the day, 0 to 23. | 
**outlets** | [**List&lt;DashboardOutletsInner&gt;**](DashboardOutletsInner.md) | The Owner's ranking, the best first. | 
**paymentMethods** | [**List&lt;DashboardPaymentMethodsInner&gt;**](DashboardPaymentMethodsInner.md) |  | 
**topMenus** | [**List&lt;DashboardTopMenusInner&gt;**](DashboardTopMenusInner.md) | At most ten, the most sold first. | 
**lowStock** | [**List&lt;DashboardLowStockInner&gt;**](DashboardLowStockInner.md) | Menus at or below their alert, or out of stock, now, whatever the period. At most 50, the emptiest first. | 
**cashiers** | [**List&lt;DashboardCashiersInner&gt;**](DashboardCashiersInner.md) | An outlet's, the most sold first. | 
**tables** | [**List&lt;DashboardTablesInner&gt;**](DashboardTablesInner.md) | An outlet's tables customers are seated at now, whatever the period. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


