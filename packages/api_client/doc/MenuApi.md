# maki_api_client.api.MenuApi

## Load the API package
```dart
import 'package:maki_api_client/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adjustStock**](MenuApi.md#adjuststock) | **POST** /api/v1/outlets/{oid}/menus/{mid}/stock-adjustments | Add, take away or count a menu&#39;s stock
[**createCategory**](MenuApi.md#createcategory) | **POST** /api/v1/outlets/{oid}/categories | Create a category
[**createMenu**](MenuApi.md#createmenu) | **POST** /api/v1/outlets/{oid}/menus | Create a menu
[**deleteCategory**](MenuApi.md#deletecategory) | **DELETE** /api/v1/outlets/{oid}/categories/{cid} | Delete a category
[**deleteMenu**](MenuApi.md#deletemenu) | **DELETE** /api/v1/outlets/{oid}/menus/{mid} | Delete a menu
[**getCategory**](MenuApi.md#getcategory) | **GET** /api/v1/outlets/{oid}/categories/{cid} | One category
[**getMenu**](MenuApi.md#getmenu) | **GET** /api/v1/outlets/{oid}/menus/{mid} | One menu
[**listCategories**](MenuApi.md#listcategories) | **GET** /api/v1/outlets/{oid}/categories | The outlet&#39;s menu categories
[**listMenus**](MenuApi.md#listmenus) | **GET** /api/v1/outlets/{oid}/menus | The outlet&#39;s menus
[**listStockMovements**](MenuApi.md#liststockmovements) | **GET** /api/v1/outlets/{oid}/menus/{mid}/stock-movements | A menu&#39;s stock history
[**reorderCategories**](MenuApi.md#reordercategories) | **PUT** /api/v1/outlets/{oid}/categories/order | Put the categories in a new order
[**setCategoryStatus**](MenuApi.md#setcategorystatus) | **PATCH** /api/v1/outlets/{oid}/categories/{cid}/status | Show or hide a category at the cashier
[**setMenuStatus**](MenuApi.md#setmenustatus) | **PATCH** /api/v1/outlets/{oid}/menus/{mid}/status | Show or hide a menu at the cashier
[**setStockAlert**](MenuApi.md#setstockalert) | **PUT** /api/v1/outlets/{oid}/menus/{mid}/stock-alert | Set a menu&#39;s stock alert
[**updateCategory**](MenuApi.md#updatecategory) | **PUT** /api/v1/outlets/{oid}/categories/{cid} | Change a category&#39;s name and icon
[**updateMenu**](MenuApi.md#updatemenu) | **PUT** /api/v1/outlets/{oid}/menus/{mid} | Change a menu


# **adjustStock**
> Menu adjustStock(oid, mid, stockAdjustmentInput)

Add, take away or count a menu's stock

Needs `stock.adjust`, on a tracked menu. `in` adds `qty` and `out` takes it away (1 to 1,000,000 at once); `set` is a stock take, the count found (0 to 1,000,000), recorded even when it matches. The count never goes below zero this way, nor above 1,000,000.  The menu is locked while its count changes, so adjustments made together each start from the count the one before left: none is lost. Each is a stock movement and a Log Action entry (`stock.adjusted`, with the count before and after, the type, the reason and the note). Answers with the menu as the adjustment left it. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String mid = mid_example; // String | 
final StockAdjustmentInput stockAdjustmentInput = ; // StockAdjustmentInput | 

try {
    final response = api.adjustStock(oid, mid, stockAdjustmentInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->adjustStock: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **mid** | **String**|  | 
 **stockAdjustmentInput** | [**StockAdjustmentInput**](StockAdjustmentInput.md)|  | 

### Return type

[**Menu**](Menu.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createCategory**
> Category createCategory(oid, categoryInput)

Create a category

Needs `menu.manage`. It goes last in the order.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final CategoryInput categoryInput = ; // CategoryInput | 

try {
    final response = api.createCategory(oid, categoryInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->createCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **categoryInput** | [**CategoryInput**](CategoryInput.md)|  | 

### Return type

[**Category**](Category.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createMenu**
> Menu createMenu(oid, menuInput)

Create a menu

Needs `menu.manage`. A tracked menu (`track_stock`) starts from `initial_stock`, its first stock movement. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final MenuInput menuInput = ; // MenuInput | 

try {
    final response = api.createMenu(oid, menuInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->createMenu: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **menuInput** | [**MenuInput**](MenuInput.md)|  | 

### Return type

[**Menu**](Menu.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCategory**
> deleteCategory(oid, cid)

Delete a category

Needs `menu.manage`. Only a category that holds no menu, deleted menus aside; its name is free again afterwards. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String cid = cid_example; // String | 

try {
    api.deleteCategory(oid, cid);
} on DioException catch (e) {
    print('Exception when calling MenuApi->deleteCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **cid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteMenu**
> deleteMenu(oid, mid)

Delete a menu

Needs `menu.manage`. Past sales keep its name and price; its SKU is free again. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String mid = mid_example; // String | 

try {
    api.deleteMenu(oid, mid);
} on DioException catch (e) {
    print('Exception when calling MenuApi->deleteMenu: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **mid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCategory**
> Category getCategory(oid, cid)

One category

Needs `menu.view`.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String cid = cid_example; // String | 

try {
    final response = api.getCategory(oid, cid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->getCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **cid** | **String**|  | 

### Return type

[**Category**](Category.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMenu**
> Menu getMenu(oid, mid)

One menu

Needs `menu.view`.

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String mid = mid_example; // String | 

try {
    final response = api.getMenu(oid, mid);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->getMenu: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **mid** | **String**|  | 

### Return type

[**Menu**](Menu.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listCategories**
> CategoryList listCategories(oid, page, pageSize)

The outlet's menu categories

Needs `menu.view`. In the order the cashier shows them (`sort_order`, then the name); deleted categories never show. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listCategories(oid, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->listCategories: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**CategoryList**](CategoryList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMenus**
> MenuList listMenus(oid, q, categoryId, status, stock, page, pageSize)

The outlet's menus

Needs `menu.view`. In the cashier's order: by the categories' order, then by name. Deleted menus never show. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String q = q_example; // String | Part of the name or the SKU, in any case.
final String categoryId = categoryId_example; // String | 
final String status = status_example; // String | 
final StockStatus stock = ; // StockStatus | The stock condition (`stock_status`).
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listMenus(oid, q, categoryId, status, stock, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->listMenus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **q** | **String**| Part of the name or the SKU, in any case. | [optional] 
 **categoryId** | **String**|  | [optional] 
 **status** | **String**|  | [optional] 
 **stock** | [**StockStatus**](.md)| The stock condition (`stock_status`). | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**MenuList**](MenuList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listStockMovements**
> StockMovementList listStockMovements(oid, mid, page, pageSize)

A menu's stock history

Needs `menu.view`. Newest first, in the order the count changed in, each naming who made it (a deleted account keeps its name here). A menu whose tracking was turned off keeps its history; its count adds up to the history's `qty_change`. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String mid = mid_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.listStockMovements(oid, mid, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->listStockMovements: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **mid** | **String**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 20]

### Return type

[**StockMovementList**](StockMovementList.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reorderCategories**
> reorderCategories(oid, categoryOrderRequest)

Put the categories in a new order

Needs `menu.manage`. `category_ids` lists every category of the outlet, each once, in the new order. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final CategoryOrderRequest categoryOrderRequest = ; // CategoryOrderRequest | 

try {
    api.reorderCategories(oid, categoryOrderRequest);
} on DioException catch (e) {
    print('Exception when calling MenuApi->reorderCategories: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **categoryOrderRequest** | [**CategoryOrderRequest**](CategoryOrderRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setCategoryStatus**
> Category setCategoryStatus(oid, cid, activeRequest)

Show or hide a category at the cashier

Needs `menu.manage`. An inactive category, and every menu in it, is hidden at the cashier; they stay in the admin area. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String cid = cid_example; // String | 
final ActiveRequest activeRequest = ; // ActiveRequest | 

try {
    final response = api.setCategoryStatus(oid, cid, activeRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->setCategoryStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **cid** | **String**|  | 
 **activeRequest** | [**ActiveRequest**](ActiveRequest.md)|  | 

### Return type

[**Category**](Category.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setMenuStatus**
> Menu setMenuStatus(oid, mid, activeRequest)

Show or hide a menu at the cashier

Needs `menu.manage`. An inactive menu is hidden at the cashier; it stays in the admin area and the reports. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String mid = mid_example; // String | 
final ActiveRequest activeRequest = ; // ActiveRequest | 

try {
    final response = api.setMenuStatus(oid, mid, activeRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->setMenuStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **mid** | **String**|  | 
 **activeRequest** | [**ActiveRequest**](ActiveRequest.md)|  | 

### Return type

[**Menu**](Menu.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **setStockAlert**
> Menu setStockAlert(oid, mid, stockAlertRequest)

Set a menu's stock alert

Needs `stock.adjust` or `menu.manage` (the alert is a field of the menu form too), on a tracked menu. At or below the alert, stock is `low`; null or 0 turns the alert off. The count stays as it is. A change is a `menu.updated` Log Action entry; the alert the menu already has records nothing. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String mid = mid_example; // String | 
final StockAlertRequest stockAlertRequest = ; // StockAlertRequest | 

try {
    final response = api.setStockAlert(oid, mid, stockAlertRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->setStockAlert: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **mid** | **String**|  | 
 **stockAlertRequest** | [**StockAlertRequest**](StockAlertRequest.md)|  | 

### Return type

[**Menu**](Menu.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateCategory**
> Category updateCategory(oid, cid, categoryInput)

Change a category's name and icon

Needs `menu.manage`. A field left out is cleared (the icon).

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String cid = cid_example; // String | 
final CategoryInput categoryInput = ; // CategoryInput | 

try {
    final response = api.updateCategory(oid, cid, categoryInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->updateCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **cid** | **String**|  | 
 **categoryInput** | [**CategoryInput**](CategoryInput.md)|  | 

### Return type

[**Category**](Category.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMenu**
> Menu updateMenu(oid, mid, menuInput)

Change a menu

Needs `menu.manage`. Every field but the stock count and the status (`is_active` is ignored here). A price change leaves past sales as they were. Turning `track_stock` on needs `initial_stock`, the count it starts from; once tracked, the count only changes through stock adjustments. Turning it off keeps the count and its history, unused. 

### Example
```dart
import 'package:maki_api_client/api.dart';

final api = MakiApiClient().getMenuApi();
final String oid = oid_example; // String | 
final String mid = mid_example; // String | 
final MenuInput menuInput = ; // MenuInput | 

try {
    final response = api.updateMenu(oid, mid, menuInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MenuApi->updateMenu: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oid** | **String**|  | 
 **mid** | **String**|  | 
 **menuInput** | [**MenuInput**](MenuInput.md)|  | 

### Return type

[**Menu**](Menu.md)

### Authorization

[accessToken](../README.md#accessToken)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

