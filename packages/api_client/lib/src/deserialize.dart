import 'package:maki_api_client/src/model/activate_device_request.dart';
import 'package:maki_api_client/src/model/activated_device.dart';
import 'package:maki_api_client/src/model/active_request.dart';
import 'package:maki_api_client/src/model/area.dart';
import 'package:maki_api_client/src/model/area_input.dart';
import 'package:maki_api_client/src/model/area_list.dart';
import 'package:maki_api_client/src/model/area_order_request.dart';
import 'package:maki_api_client/src/model/area_ref.dart';
import 'package:maki_api_client/src/model/box.dart';
import 'package:maki_api_client/src/model/category.dart';
import 'package:maki_api_client/src/model/category_input.dart';
import 'package:maki_api_client/src/model/category_list.dart';
import 'package:maki_api_client/src/model/category_order_request.dart';
import 'package:maki_api_client/src/model/change_email_request.dart';
import 'package:maki_api_client/src/model/change_password_request.dart';
import 'package:maki_api_client/src/model/create_order_item.dart';
import 'package:maki_api_client/src/model/create_order_payment.dart';
import 'package:maki_api_client/src/model/create_order_request.dart';
import 'package:maki_api_client/src/model/create_staff_request.dart';
import 'package:maki_api_client/src/model/decoration.dart';
import 'package:maki_api_client/src/model/delete_outlet_request.dart';
import 'package:maki_api_client/src/model/device.dart';
import 'package:maki_api_client/src/model/device_list.dart';
import 'package:maki_api_client/src/model/device_person.dart';
import 'package:maki_api_client/src/model/dine_in_mode_setting.dart';
import 'package:maki_api_client/src/model/error.dart';
import 'package:maki_api_client/src/model/error_envelope.dart';
import 'package:maki_api_client/src/model/floor.dart';
import 'package:maki_api_client/src/model/floor_area.dart';
import 'package:maki_api_client/src/model/floor_table.dart';
import 'package:maki_api_client/src/model/forgot_password_request.dart';
import 'package:maki_api_client/src/model/layout.dart';
import 'package:maki_api_client/src/model/layout_input.dart';
import 'package:maki_api_client/src/model/list_meta.dart';
import 'package:maki_api_client/src/model/login_request.dart';
import 'package:maki_api_client/src/model/manager_ref.dart';
import 'package:maki_api_client/src/model/me.dart';
import 'package:maki_api_client/src/model/menu.dart';
import 'package:maki_api_client/src/model/menu_category.dart';
import 'package:maki_api_client/src/model/menu_input.dart';
import 'package:maki_api_client/src/model/menu_list.dart';
import 'package:maki_api_client/src/model/order.dart';
import 'package:maki_api_client/src/model/order_item.dart';
import 'package:maki_api_client/src/model/order_list.dart';
import 'package:maki_api_client/src/model/order_payment.dart';
import 'package:maki_api_client/src/model/order_person.dart';
import 'package:maki_api_client/src/model/order_summary.dart';
import 'package:maki_api_client/src/model/outlet.dart';
import 'package:maki_api_client/src/model/outlet_input.dart';
import 'package:maki_api_client/src/model/outlet_list.dart';
import 'package:maki_api_client/src/model/outlet_status_request.dart';
import 'package:maki_api_client/src/model/outlet_summary.dart';
import 'package:maki_api_client/src/model/permission_catalog.dart';
import 'package:maki_api_client/src/model/permission_group.dart';
import 'package:maki_api_client/src/model/placement.dart';
import 'package:maki_api_client/src/model/pos_catalog.dart';
import 'package:maki_api_client/src/model/pos_category.dart';
import 'package:maki_api_client/src/model/pos_device.dart';
import 'package:maki_api_client/src/model/pos_device_info.dart';
import 'package:maki_api_client/src/model/pos_menu.dart';
import 'package:maki_api_client/src/model/pos_outlet.dart';
import 'package:maki_api_client/src/model/refresh_request.dart';
import 'package:maki_api_client/src/model/reset_password_request.dart';
import 'package:maki_api_client/src/model/reset_staff_password_request.dart';
import 'package:maki_api_client/src/model/role.dart';
import 'package:maki_api_client/src/model/role_detail.dart';
import 'package:maki_api_client/src/model/role_input.dart';
import 'package:maki_api_client/src/model/role_list.dart';
import 'package:maki_api_client/src/model/role_user.dart';
import 'package:maki_api_client/src/model/schedule.dart';
import 'package:maki_api_client/src/model/schedule_input.dart';
import 'package:maki_api_client/src/model/schedule_list.dart';
import 'package:maki_api_client/src/model/schedule_table.dart';
import 'package:maki_api_client/src/model/seated.dart';
import 'package:maki_api_client/src/model/session.dart';
import 'package:maki_api_client/src/model/staff.dart';
import 'package:maki_api_client/src/model/staff_list.dart';
import 'package:maki_api_client/src/model/staff_role.dart';
import 'package:maki_api_client/src/model/staff_status_request.dart';
import 'package:maki_api_client/src/model/status.dart';
import 'package:maki_api_client/src/model/stock_adjustment_input.dart';
import 'package:maki_api_client/src/model/stock_alert_request.dart';
import 'package:maki_api_client/src/model/stock_movement.dart';
import 'package:maki_api_client/src/model/stock_movement_list.dart';
import 'package:maki_api_client/src/model/stock_movement_user.dart';
import 'package:maki_api_client/src/model/table.dart';
import 'package:maki_api_client/src/model/table_input.dart';
import 'package:maki_api_client/src/model/table_list.dart';
import 'package:maki_api_client/src/model/token_request.dart';
import 'package:maki_api_client/src/model/update_me_request.dart';
import 'package:maki_api_client/src/model/update_staff_request.dart';
import 'package:maki_api_client/src/model/user_ref.dart';
import 'package:maki_api_client/src/model/validate_voucher_request.dart';
import 'package:maki_api_client/src/model/void_order_request.dart';
import 'package:maki_api_client/src/model/voucher.dart';
import 'package:maki_api_client/src/model/voucher_input.dart';
import 'package:maki_api_client/src/model/voucher_list.dart';
import 'package:maki_api_client/src/model/voucher_outlet.dart';
import 'package:maki_api_client/src/model/voucher_quote.dart';
import 'package:maki_api_client/src/model/voucher_redemption.dart';
import 'package:maki_api_client/src/model/voucher_redemption_list.dart';
import 'package:maki_api_client/src/model/voucher_terms.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

  ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType, {bool growable= true}) {
      switch (targetType) {
        case 'String':
          return '$value' as ReturnType;
        case 'int':
          return (value is int ? value : int.parse('$value')) as ReturnType;
        case 'bool':
          if (value is bool) {
            return value as ReturnType;
          }
          final valueString = '$value'.toLowerCase();
          return (valueString == 'true' || valueString == '1') as ReturnType;
        case 'double':
          return (value is double ? value : double.parse('$value')) as ReturnType;
        case 'ActivateDeviceRequest':
          return ActivateDeviceRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ActivatedDevice':
          return ActivatedDevice.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ActiveRequest':
          return ActiveRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Area':
          return Area.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AreaInput':
          return AreaInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AreaList':
          return AreaList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AreaOrderRequest':
          return AreaOrderRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'AreaRef':
          return AreaRef.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Box':
          return Box.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Category':
          return Category.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CategoryInput':
          return CategoryInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CategoryList':
          return CategoryList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CategoryOrderRequest':
          return CategoryOrderRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ChangeEmailRequest':
          return ChangeEmailRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ChangePasswordRequest':
          return ChangePasswordRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CreateOrderItem':
          return CreateOrderItem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CreateOrderPayment':
          return CreateOrderPayment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CreateOrderRequest':
          return CreateOrderRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'CreateStaffRequest':
          return CreateStaffRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Decoration':
          return Decoration.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DecorationKind':
          
          
        case 'DeleteOutletRequest':
          return DeleteOutletRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Device':
          return Device.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DeviceList':
          return DeviceList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DevicePerson':
          return DevicePerson.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'DineInMode':
          
          
        case 'DineInModeSetting':
          return DineInModeSetting.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Error':
          return Error.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ErrorEnvelope':
          return ErrorEnvelope.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Floor':
          return Floor.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FloorArea':
          return FloorArea.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'FloorTable':
          return FloorTable.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ForgotPasswordRequest':
          return ForgotPasswordRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Layout':
          return Layout.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LayoutInput':
          return LayoutInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ListMeta':
          return ListMeta.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'LoginRequest':
          return LoginRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ManagerRef':
          return ManagerRef.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Me':
          return Me.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Menu':
          return Menu.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MenuCategory':
          return MenuCategory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MenuInput':
          return MenuInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'MenuList':
          return MenuList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Order':
          return Order.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OrderItem':
          return OrderItem.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OrderList':
          return OrderList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OrderPayment':
          return OrderPayment.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OrderPerson':
          return OrderPerson.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OrderStatus':
          
          
        case 'OrderSummary':
          return OrderSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OrderType':
          
          
        case 'Outlet':
          return Outlet.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OutletInput':
          return OutletInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OutletList':
          return OutletList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OutletStatusRequest':
          return OutletStatusRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'OutletSummary':
          return OutletSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PaymentMethod':
          
          
        case 'PermissionCatalog':
          return PermissionCatalog.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PermissionGroup':
          return PermissionGroup.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Placement':
          return Placement.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PosCatalog':
          return PosCatalog.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PosCategory':
          return PosCategory.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PosDevice':
          return PosDevice.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PosDeviceInfo':
          return PosDeviceInfo.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PosMenu':
          return PosMenu.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'PosOutlet':
          return PosOutlet.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RefreshRequest':
          return RefreshRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResetPasswordRequest':
          return ResetPasswordRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ResetStaffPasswordRequest':
          return ResetStaffPasswordRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Role':
          return Role.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RoleDetail':
          return RoleDetail.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RoleInput':
          return RoleInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RoleList':
          return RoleList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'RoleUser':
          return RoleUser.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Rotation':
          
          
        case 'Schedule':
          return Schedule.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ScheduleInput':
          return ScheduleInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ScheduleList':
          return ScheduleList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ScheduleStatus':
          
          
        case 'ScheduleTable':
          return ScheduleTable.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Seated':
          return Seated.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Session':
          return Session.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Staff':
          return Staff.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StaffList':
          return StaffList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StaffRole':
          return StaffRole.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StaffStatusRequest':
          return StaffStatusRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Status':
          return Status.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StockAdjustmentInput':
          return StockAdjustmentInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StockAlertRequest':
          return StockAlertRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StockMovement':
          return StockMovement.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StockMovementList':
          return StockMovementList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StockMovementUser':
          return StockMovementUser.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'StockStatus':
          
          
        case 'Table':
          return Table.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TableInput':
          return TableInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TableList':
          return TableList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'TableShape':
          
          
        case 'TableStatus':
          
          
        case 'TokenRequest':
          return TokenRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateMeRequest':
          return UpdateMeRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UpdateStaffRequest':
          return UpdateStaffRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'UserRef':
          return UserRef.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'ValidateVoucherRequest':
          return ValidateVoucherRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VoidOrderRequest':
          return VoidOrderRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'Voucher':
          return Voucher.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VoucherInput':
          return VoucherInput.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VoucherList':
          return VoucherList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VoucherOutlet':
          return VoucherOutlet.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VoucherQuote':
          return VoucherQuote.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VoucherRedemption':
          return VoucherRedemption.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VoucherRedemptionList':
          return VoucherRedemptionList.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VoucherStatus':
          
          
        case 'VoucherTerms':
          return VoucherTerms.fromJson(value as Map<String, dynamic>) as ReturnType;
        case 'VoucherType':
          
          
        default:
          RegExpMatch? match;

          if (value is List && (match = _regList.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toList(growable: growable) as ReturnType;
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
            targetType = match![1]!; // ignore: parameter_assignments
            return value
              .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable))
              .toSet() as ReturnType;
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
            targetType = match![1]!.trim(); // ignore: parameter_assignments
            return Map<String, BaseType>.fromIterables(
              value.keys as Iterable<String>,
              value.values.map((dynamic v) => deserialize<BaseType, BaseType>(v, targetType, growable: growable)),
            ) as ReturnType;
          }
          break;
    }
    throw Exception('Cannot deserialize');
  }