import 'package:get/get.dart' show GetPage, Transition;
import 'package:star_shop/app/bindings/current_orders_binding.dart';
import 'package:star_shop/app/bindings/events_binding.dart';
import 'package:star_shop/app/bindings/refund_request_binding.dart';
import 'package:star_shop/app/bindings/sos_binding.dart';
import 'package:star_shop/app/bindings/task_and_reminder_binding.dart';
import 'package:star_shop/app/bindings/transportation_binding.dart';
import 'package:star_shop/app/bindings/wallet_binding.dart';
import 'package:star_shop/app/modules/awareness_and_courses/awareness_view.dart';
import 'package:star_shop/app/modules/card_and_tags/request_card_tag_view.dart';
import 'package:star_shop/app/modules/create_order/canteen/canteen_cart.dart';
import 'package:star_shop/app/modules/create_order/cart_view.dart';
import 'package:star_shop/app/modules/create_order/create_order_base_view.dart';
import 'package:star_shop/app/modules/create_order/uniform/set_manual_size.dart';
import 'package:star_shop/app/modules/create_product/create_canteen_product.dart';
import 'package:star_shop/app/modules/create_product/create_stationary_product.dart';
import 'package:star_shop/app/modules/current_orders/current_orders_base_view.dart';
import 'package:star_shop/app/modules/events/events_view.dart';
import 'package:star_shop/app/modules/menu_item_list/menu_item_list.dart';
import 'package:star_shop/app/modules/my_profile/sub_pages/staff/add_staff_view.dart';
import 'package:star_shop/app/modules/orders/canteen/canteen_order_datails_view.dart';
import 'package:star_shop/app/modules/orders/canteen/canteen_order_return_view.dart';
import 'package:star_shop/app/modules/orders/delivery_address_view.dart';
import 'package:star_shop/app/modules/orders/order_base_view.dart';
import 'package:star_shop/app/modules/orders/return_item_view.dart';
import 'package:star_shop/app/modules/orders/stationary/stationary_order_detail_view.dart';
import 'package:star_shop/app/modules/products/product_base_view.dart';
import 'package:star_shop/app/modules/rating/driver_rating_view.dart';
import 'package:star_shop/app/modules/refund_request/refund_request_view.dart';
import 'package:star_shop/app/modules/task_and_reminders/set_reminder_screen.dart';
import 'package:star_shop/app/modules/task_and_reminders/task_and_reminder_view.dart';
import 'package:star_shop/app/modules/transaction_record/transaction_record_view.dart';
import 'package:star_shop/app/modules/transportation/bus_notification/bus_notification_view.dart';
import 'package:star_shop/app/modules/transportation/location/bus_location_view.dart';
import 'package:star_shop/app/modules/transportation/location/change_location_view.dart';
import 'package:star_shop/app/modules/transportation/notify_authorities/notify_authorities_view.dart';
import 'package:star_shop/app/modules/transportation/transportation_base_view.dart';

import '../bindings/activation_binding.dart';
import '../bindings/attendance_binding.dart';
import '../bindings/auth_binding.dart';
import '../bindings/awareness_binding.dart';
import '../bindings/base_bindings.dart';
import '../bindings/card_and_tags_binding.dart';
import '../bindings/complain_binding.dart';
import '../bindings/create_order_binding.dart';
import '../bindings/create_product_binding.dart';
import '../bindings/early_leave_binding.dart';
import '../bindings/edit_profile_binding.dart';
import '../bindings/feedback_binding.dart';
import '../bindings/language_select_binding.dart';
import '../bindings/leave_request_binding.dart';
import '../bindings/medical_record_binding.dart';
import '../bindings/menu_item_list_binding.dart';
import '../bindings/message_binding.dart';
import '../bindings/news_binding.dart';
import '../bindings/notification_binding.dart';
import '../bindings/orders_binding.dart';
import '../bindings/out_of_stock_binding.dart';
import '../bindings/performance_binding.dart';
import '../bindings/product_binding.dart';
import '../bindings/rating_binding.dart';
import '../bindings/rules_binding.dart';
import '../bindings/salary_slip_binding.dart';
import '../bindings/transaction_record_binding.dart';
import '../modules/activation_deactivation/activation_request_view.dart';
import '../modules/activation_deactivation/deactivation_details_view.dart';
import '../modules/auth/account_activation_view.dart';
import '../modules/auth/login_as_view.dart';
import '../modules/auth/login_view.dart';
import '../modules/auth/verification_view.dart';
import '../modules/base_view/base_view.dart';
import '../modules/card_and_tags/card_and_tag_view.dart';
import '../modules/card_and_tags/card_and_tag_cart_view.dart';
import '../modules/complains_and_reports/complain_view.dart';
import '../modules/complains_and_reports/raise_complain_view.dart';
import '../modules/create_order/menu_base_view.dart';
import '../modules/create_product/create_uniform_product.dart';
import '../modules/early_leave_and_permissions/early_leave_view.dart';
import '../modules/early_leave_and_permissions/leave_permission_view.dart';
import '../modules/events/event_details_view.dart';
import '../modules/feedback_and_help/add_feedback_view.dart';
import '../modules/feedback_and_help/feedback_view.dart';
import '../modules/leave_request/leave_request_view.dart';
import '../modules/leave_request/request_leave.dart';
import '../modules/medical_records/medical_record_view.dart';
import '../modules/message/message_view.dart';
import '../modules/my_attendance/attendance_view.dart';
import '../modules/my_attendance/calendar_view.dart';
import '../modules/my_performance/performance_view.dart';
import '../modules/my_profile/sub_pages/details/edit_profile/edit_profile_view.dart';
import '../modules/my_profile/sub_pages/details/salary_slip_view.dart';
import '../modules/news/news_view.dart';
import '../modules/notifications/notification_settings_view.dart';
import '../modules/notifications/notification_view.dart';
import '../modules/out_of_stock_items/out_of_stock_items.dart';
import '../modules/rating/bus_rating_view.dart';
import '../modules/rating/staff_rating_view.dart';
import '../modules/rating/supervisor_rating_view.dart';
import '../modules/rules_regulations/code_of_conduct_view.dart';
import '../modules/rules_regulations/rules_view.dart';
import '../modules/select_language/language_select.dart';
import '../modules/sos/ask_for_help_view.dart';
import '../modules/sos/fire_emergency_view.dart';
import '../modules/sos/medical_support_sos_view.dart';
import '../modules/sos/qr_scanner_view.dart';
import '../modules/sos/sos_assembly_view.dart';
import '../modules/sos/sos_view.dart';
import '../modules/splash/splash_view.dart';
import '../modules/transaction_record/add_money_dialogs/today_transaction.dart';
import '../modules/wallet/wallet/wallet_view.dart';
import '../modules/wallet/wallet_view.dart';
import 'app_routes.dart';

class Theme1AppPages {
  static const initial = Routes.splash;
  // static const initial = Routes.baseView;
  static final routes = [
    GetPage(name: Routes.splash, page: () => const SplashView()),
    GetPage(
        name: Routes.selectLanguageView,
        page: () => const LanguageSelectView(),
        binding: LanguageSelectBinding()),
    GetPage(
        name: Routes.loginView,
        page: () => const LoginView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.verificationView,
        page: () => const VerificationView(),
        binding: AuthBinding()),
    // GetPage(name: Routes.loginAsView, page: () => const LoginAsView(),binding: AuthBinding()),
    GetPage(
        name: Routes.accountActivationView,
        page: () => const AccountActivationView(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.rulesView,
        page: () => const RulesView(),
        binding: RulesBinding()),
    GetPage(
        name: Routes.codeOfConductView,
        page: () => const CodeOfConductView(),
        binding: RulesBinding()),
    GetPage(
        name: Routes.baseView,
        page: () => const BaseView(),
        binding: BaseBinding()),
    GetPage(
        name: Routes.editProfileView,
        page: () => const EditProfileView(),
        binding: EditProfileBinding()),
    GetPage(
        name: Routes.salarySlipView,
        page: () => const SalarySlipView(),
        binding: SalarySlipBinding()),
    GetPage(
        name: Routes.addStaffView,
        page: () => const AddStaffView(),
        binding: BaseBinding()),
    GetPage(
        name: Routes.notificationView,
        page: () => const NotificationView(),
        binding: NotificationBinding()),
    GetPage(
        name: Routes.notificationSettings,
        page: () => const NotificationSettingsView(),
        binding: NotificationBinding()),
    GetPage(
        name: Routes.cardTagsView,
        page: () => const CardAndTagsView(),
        binding: CardAndTagsBinding()),
    GetPage(
        name: Routes.cardAndTagCartView,
        page: () => const CardAndTagCartView(),
        binding: CardAndTagsBinding()),
    GetPage(
        name: Routes.requestCardTagsView,
        page: () => const RequestCardAndTagsView(),
        binding: CardAndTagsBinding()),
    GetPage(
        name: Routes.medicalRecordView,
        page: () => const MedicalRecordView(),
        binding: MedicalRecordBinding()),
    GetPage(
        name: Routes.attendanceView,
        page: () => const AttendanceView(),
        binding: AttendanceBinding()),
    GetPage(
        name: Routes.calendarView,
        page: () => const CalendarView(),
        binding: AttendanceBinding()),
    GetPage(
        name: Routes.leaveRequestView,
        page: () => const LeaveRequestView(),
        binding: LeaveRequestBinding()),
    GetPage(
        name: Routes.requestLeave,
        page: () => const RequestLeave(),
        binding: LeaveRequestBinding()),
    GetPage(
        name: Routes.earlyLeave,
        page: () => const EarlyLeaveView(),
        binding: EarlyLeaveBinding()),
    GetPage(
        name: Routes.leavePermission,
        page: () => const LeavePermissionView(),
        binding: EarlyLeaveBinding()),
    GetPage(
        name: Routes.performanceView,
        page: () => const PerformanceView(),
        binding: PerformanceBinding()),
    GetPage(
        name: Routes.complainView,
        page: () => const ComplainView(),
        binding: ComplainBinding()),
    GetPage(
        name: Routes.raiseComplain,
        page: () => const RaiseComplainView(),
        binding: ComplainBinding()),
    GetPage(
        name: Routes.feedbackView,
        page: () => const FeedbackView(),
        binding: FeedbackBinding()),
    GetPage(
        name: Routes.addFeedbackView,
        page: () => const AddFeedbackView(),
        binding: FeedbackBinding()),
    GetPage(
        name: Routes.menuItemList,
        page: () => const MenuItemList(),
        binding: MenuItemListBinding()),
    GetPage(
        name: Routes.productBaseView,
        page: () => const ProductBaseView(),
        binding: ProductBinding()),
    GetPage(
        name: Routes.createCanteenProduct,
        page: () => const CreateCanteenProduct(),
        binding: CreateProductBinding()),
    GetPage(
        name: Routes.createStationaryProduct,
        page: () => const CreateStationaryProduct(),
        binding: CreateProductBinding()),
    GetPage(
        name: Routes.createUniformProduct,
        page: () => const CreateUniformProduct(),
        binding: CreateProductBinding()),
    GetPage(
        name: Routes.createStarStoreProduct,
        page: () => const ProductBaseView(),
        binding: CreateProductBinding()),
    GetPage(
        name: Routes.outOfStockItems,
        page: () => const OutOfStockView(),
        binding: OutOfStockBinding()),
    GetPage(
        name: Routes.transactionRecordView,
        page: () => const TransactionRecordView(),
        binding: TransactionRecordBinding()),
    GetPage(
        name: Routes.todayTransactionRecordView,
        page: () => const TodayTransactionView(),
        binding: TransactionRecordBinding()),
    GetPage(
        name: Routes.orderView,
        page: () => const OrdersBaseView(),
        binding: OrdersBinding()),
    GetPage(
        name: Routes.currentOrderView,
        page: () => const CurrentOrdersBaseView(),
        binding: CurrentOrdersBinding()),
    GetPage(
        name: Routes.returnOrderView,
        page: () => const ReturnedOrderItemsView(),
        binding: OrdersBinding()),
    GetPage(
        name: Routes.canteenOrderDetailView,
        page: () => const CanteenOrderDetailView(),
        binding: OrdersBinding()),
    GetPage(
        name: Routes.canteenOrderReturnView,
        page: () => const CanteenOrderReturnView(),
        binding: OrdersBinding()),
    GetPage(
        name: Routes.stationaryOrderDetailView,
        page: () => const StationaryOrderDetailView(),
        binding: OrdersBinding()),
    GetPage(
        name: Routes.deliveryAddressView,
        page: () => const DeliveryAddressView(),
        binding: OrdersBinding()),
    GetPage(
        name: Routes.messageView,
        page: () => const MessageView(),
        binding: MessageBinding()),
    GetPage(
        name: Routes.createOrderView,
        page: () => const CreateOrderBaseView(),
        binding: CreateOrderBinding()),
    GetPage(
        name: Routes.menuBaseView,
        page: () => const MenuBaseView(),
        binding: CreateOrderBinding()),
    GetPage(
        name: Routes.canteenCartView,
        page: () => const CanteenCart(),
        binding: CreateOrderBinding()),
    GetPage(
        name: Routes.cartView,
        page: () => const CartView(),
        binding: CreateOrderBinding()),
    GetPage(
        name: Routes.setManualSizeView,
        page: () => const SetManualSizeView(),
        binding: CreateOrderBinding()),
    GetPage(
        name: Routes.busRating,
        page: () => const BusRatingView(),
        binding: RatingBinding()),
    GetPage(
        name: Routes.staffRating,
        page: () => const StaffRatingView(),
        binding: RatingBinding()),
    GetPage(
        name: Routes.driverRating,
        page: () => const DriverRatingView(),
        binding: RatingBinding()),
    GetPage(
        name: Routes.supervisorRating,
        page: () => const SupervisorRatingView(),
        binding: RatingBinding()),
    GetPage(
        name: Routes.deactivationDetails,
        page: () => const DeactivationDetailsView(),
        binding: ActivationBinding()),
    GetPage(
        name: Routes.activationRequest,
        page: () => const ActivationRequestView(),
        binding: ActivationBinding()),
    GetPage(
        name: Routes.transportationBaseView,
        page: () => const TransportationBaseView(),
        binding: TransportationBinding()),
    GetPage(
        name: Routes.sosView,
        page: () => const SosView(),
        binding: SOSBinding()),

    GetPage(
        name: Routes.notifyAuthorities,
        page: () => const NotifyAuthoritiesView(),
        binding: TransportationBinding()),
    GetPage(
        name: Routes.busNotificationView,
        page: () => const BusNotificationView(),
        binding: TransportationBinding()),
    GetPage(
        name: Routes.busLocationTransportation,
        page: () => const BusLocationView(),
        binding: TransportationBinding()),
    GetPage(
        name: Routes.changeBusLocation,
        page: () => const ChangeLocationView(),
        binding: TransportationBinding()),
    GetPage(
        name: Routes.refundRequestView,
        page: () => const RefundRequestView(),
        binding: RefundRequestBinding()),
    GetPage(
        name: Routes.newsView,
        page: () => const NewsView(),
        binding: NewsBinding()),
    GetPage(
        name: Routes.sos, page: () => const SosView(), binding: SOSBinding()),
    GetPage(
        name: Routes.qrScanner,
        page: () => const QrScannerView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.fireEmergency,
        page: () => const FireEmergencyView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.medicalSupportSOS,
        page: () => const MedicalSupportSosView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.askForHelp,
        page: () => const AskForHelpView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.sosAssembly,
        page: () => const SosAssemblyView(),
        binding: SOSBinding()),
    GetPage(
        name: Routes.walletView,
        page: () => const WalletView(),
        binding: WalletBinding()),
    GetPage(
        name: Routes.taskReminderView,
        page: () => const TaskAndReminderView(),
        binding: TaskAndReminderBinding()),
    GetPage(
        name: Routes.addTaskReminder,
        page: () => const SetReminderView(),
        binding: TaskAndReminderBinding()),
    GetPage(
        name: Routes.eventsView,
        page: () => const EventsView(),
        binding: EventsBinding()),
    GetPage(
        name: Routes.eventDetailsView,
        page: () => const EventDetailsView(),
        binding: EventsBinding()),
    GetPage(
        name: Routes.awarenessView,
        page: () => const AwarenessView(),
        binding: AwarenessBinding()),
  ];
}
