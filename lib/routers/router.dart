import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './router_name.dart';
import './router_path.dart';

// Import các màn hình tương ứng
import '../ui/pages/startPage.dart';
import '../ui/pages/loginPages/login_page.dart';
//searchpage
import '../ui/pages/customerPages/shopping_page.dart';
import '../ui/pages/customerPages/myhome_page.dart';
import '../ui/pages/customerPages/booking_page.dart';
import '../ui/pages/customerPages/order_page.dart';
import '../ui/pages/customerPages/user_detail.dart';
import '../ui/pages/customerPages/shop_detail.dart';
import '../ui/pages/customerPages/appointment_page.dart';

//SearchPage
import '../ui/pages/search_pages/search_page.dart';
import '../ui/pages/search_pages/search_results_page.dart';
//product
import '../ui/pages/productPages/device_page.dart';
import '../ui/pages/productPages/nail_page.dart';
import '../ui/pages/productPages/nailbox_page.dart';
//loginpage
import '../ui/pages/loginPages/login_page.dart';
import '../ui/pages/loginPages/otp_page.dart';
import '../ui/pages/loginPages/register_page.dart';
import '../ui/pages/loginPages/resetpass_page.dart';
//adminpage
import '../ui/pages/adminPages/admin_page.dart';
import '../ui/pages/adminPages/accounts_page.dart';
import '../ui/pages/adminPages/edit_page.dart';
import '../ui/pages/adminPages/management_page.dart';
import '../ui/pages/adminPages/revenue_page.dart';
//product detail
import '../ui/pages/productPages/product_detail_page.dart';
//nailsample
import '../ui/pages/productPages/nailSample_page.dart';
//employee
import '../ui/pages/employeePages/employee_page.dart';
//cârt
import '../ui/pages/cart_pages/cart_page.dart';
//otppage
import '../ui/pages/loginPages/otp_page.dart';
//chatpage
import '../ui/pages/chat_pages/chat_page.dart';
//pointpage
import '../ui/pages/point_page/point_page.dart';
import '../ui/pages/customerPages/appointment_page.dart';
//getit
import 'package:get_it/get_it.dart';

import '../core/dependency_injection/service_locator.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ui/pages/productPages/nailbox_page.dart';
import '../blocs/bloc/user_bloc.dart';
import '../blocs/bloc/role_bloc.dart';
import '../blocs/bloc/register_bloc.dart';
import '../blocs/bloc/product_bloc/search_all.dart';
import '../blocs/bloc/storage_search_history/storage_search_history_bloc.dart';
import '../blocs/bloc/storage_search_history/suggestion_history_bloc.dart';
import '../blocs/bloc/product_bloc/search_product_name_bloc.dart';
import '../features/fetch_detail_product/bloc.dart';
import '../features/fetch_cartItem/cart_item_bloc.dart';

import '../blocs/bloc/product_bloc/search_product_category_bloc.dart';
import '../features/add_product_inCart/add_product_bloc.dart';
import '../features/get_point_daily/getPoint_bloc.dart';

//usecase
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/get_role.dart';
import '../domain/usecases/refreshToken_usecase.dart';
import '../domain/usecases/logout_usecase.dart';
import '../domain/usecases/check_user.dart';
import '../domain/usecases/register_user.dart';
import '../domain/usecases/get_user.dart';
import '../domain/usecases/cartItem_usecase/get_all_cartItem_uc.dart';
import '../domain/usecases/cartItem_usecase/delete_cartItem_usecase.dart';
import '../domain/usecases/cartItem_usecase/update_cartItem_usecase.dart';
import '../domain/usecases/cartItem_usecase/add_cartItem_usecase.dart';
import '../domain/usecases/cartItem_usecase/option_value_usecase.dart';
//pointusecase
import '../domain/usecases/point_usecase.dart';

//storage
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//search usecase
import '../domain/usecases/search_usecases/add_keyword.dart';
import '../domain/usecases/search_usecases/clear_history_search.dart';
import '../domain/usecases/search_usecases/getHistoryUsecase.dart';
import '../domain/usecases/search_usecases/search_suggestion_usecase.dart';
import '../domain/usecases/product_usecase/search_product_usecase.dart';
//entity
import '../domain/entities/products.dart';
import '../ui/widgets/page_view/app_error_page.dart';

//voucher
import '../features/fetch_Voucher/fetch_voucher_bloc.dart';
import '../domain/usecases/voucher_usecase.dart';
import '../ui/pages/customerPages/voucher_page.dart';
//booking
import '../ui/pages/customerPages/booking_page.dart';
//spending
import '../ui/pages/customerPages/spending_page.dart';
//fetchprofilebloc
import '../features/fetch_profile/fetch_profile_bloc.dart';
import '../domain/usecases/customer_usecase.dart';
import '../ui/pages/customerPages/update_profile_page.dart';
//edit address
import '../ui/pages/customerPages/edit_address_page.dart';
import '../features/edit_address/edit_address_bloc.dart';
import '../ui/pages/customerPages/edit_detail_address.dart';
import '../domain/usecases/address_usecase.dart';
//fetchorder
import '../features/fetch_order/fetch_order_bloc.dart';
import '../domain/usecases/order_usecase.dart';

import '../ui/pages/customerPages/order_pages/confirm_order_page.dart';

import '../ui/pages/customerPages/order_pages/load_voucher_page.dart';
import '../ui/pages/customerPages/order_pages/loadAddress_page.dart';
import '../ui/pages/customerPages/order_pages/success_order_page.dart';
import '../ui/pages/adminPages/order_page/order_spending_page.dart';

import '../ui/pages/adminPages/order_page/order_spending_detail.dart';
import '../ui/pages/adminPages/order_page/order_stranf_page.dart';

import '../ui/pages/adminPages/order_page/order_stranf_detail.dart';
//bloc
import '../feature_admin/manage_order/manage_order_bloc.dart';
import '../ui/pages/adminPages/order_page/order_cancel_page.dart';
import '../ui/pages/adminPages/order_page/order_cancel_detail.dart';
import '../ui/pages/adminPages/order_page/order_complete_detail.dart';
import '../ui/pages/adminPages/order_page/order_complete_page.dart';
import '../ui/pages/adminPages/order_page/order_confirm_page.dart';
import '../ui/pages/adminPages/order_page/order_confirm_detail.dart';

import '../features/get_order_Customer/get_order_bloc.dart';
import '../features/get_order_Customer/get_order_event.dart';
import '../ui/pages/customerPages/order_pages/wait_confirm_page.dart';
import '../ui/pages/customerPages/order_pages/confirm_order_view.dart';
import '../ui/pages/customerPages/order_pages/transport_page.dart';
import '../ui/pages/customerPages/order_pages/received_page.dart';
import '../ui/pages/customerPages/order_pages/cancel_order_view.dart';
import '../ui/pages/customerPages/order_pages/order_detail_cs_page.dart';
//order
import '../domain/entities/order/order.dart';
//
import '../features/get_spending/get_spending_bloc.dart';
import '../domain/usecases/spending_usecase.dart';
import '../ui/pages/customerPages/spending_detail_page.dart';
import '../ui/pages/adminPages/voucher_ad_page/get_voucher_ad_page.dart';

import '../ui/pages/adminPages/voucher_ad_page/add_voucher_ad_page.dart';
import '../feature_admin/manage_voucher/manage_voucher_event.dart';
import '../feature_admin/manage_voucher/manage_voucher_bloc.dart';
import '../ui/pages/adminPages/voucher_ad_page/Update_voucher_ad_page.dart';
import '../domain/entities/vouchers.dart';
// productAD
import '../ui/pages/adminPages/manage_product/product_nail_AD_page.dart';
import '../ui/pages/adminPages/manage_product/product_nailBox_AD_page.dart';
import '../ui/pages/adminPages/manage_product/product_device_AD_page.dart';
import '../ui/pages/adminPages/manage_product/product_detail_AD_page.dart';
import '../feature_admin/manage_import/import_bloc.dart';
import '../feature_admin/manage_import/import_event.dart';
import '../domain/usecases/import_usecase.dart';
import '../ui/pages/adminPages/get_product_AD_page/getProduct_bestselt.dart';

import '../ui/pages/adminPages/get_product_AD_page/get_product_new.dart';

import '../ui/pages/adminPages/get_product_AD_page/get_product_soldout.dart';

import '../ui/pages/adminPages/get_product_AD_page/get_product_stock.dart';

import '../ui/pages/adminPages/get_product_AD_page/get_product_trending.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.start,
  routes: [
    GoRoute(
      path: RoutePaths.start,
      name: RouteNames.start,
      builder: (context, state) {
        return StartPage();
      },
    ),

    GoRoute(
      path: RoutePaths.search,
      name: RouteNames.search,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<StorageSearchHistoryBloc>(
              create: (_) => StorageSearchHistoryBloc(
                addKeywordUsecase: sl<AddKeyword>(),
                getHistoryUsecase: sl<GetSearchHistory>(),
                clear: sl<ClearHistorySearch>(),
              ),
            ),
            BlocProvider<SuggestionHistoryBloc>(
              create: (_) =>
                  SuggestionHistoryBloc(sl<SearchSuggestionUseCase>()),
            ),
          ],
          child: SearchPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.searchResult,
      name: RouteNames.searchResult,
      builder: (context, state) {
        final extra = state.extra;
        String keyword;
        if (extra is String) {
          keyword = extra;
        } else if (extra is Map<String, dynamic> &&
            extra['keyword'] is String) {
          keyword = extra['keyword'] as String;
        } else {
          return AppErrorPage(message: 'Thiếu tham số tìm kiếm');
        }

        return MultiBlocProvider(
          providers: [
            BlocProvider<SearchProductNameBloc>(
              create: (_) => SearchProductNameBloc(sl<SearchProductUseCase>()),
            ),
          ],
          child: SearchResultsPage(selectedKeyword: keyword),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.home,
      name: RouteNames.home,
      builder: (context, state) {
        return MyHomePage();
      },
    ),
    GoRoute(
      path: RoutePaths.booking,
      name: RouteNames.booking,
      builder: (context, state) {
        return Booking();
      },
    ),
    GoRoute(
      path: RoutePaths.order,
      name: RouteNames.order,
      builder: (context, state) => OrderHistory(),
    ),
    GoRoute(
      path: RoutePaths.cart,
      name: RouteNames.cart,
      builder: (context, state) {
        return BlocProvider<CartItemBloc>(
          create: (_) => CartItemBloc(
            getAll: sl<GetAllCartItemUseCase>(),
            deleteCartItem: sl<DeleteCartItemUseCase>(),
            updateCartItem: sl<UpdateCartItemUseCase>(),
          ),
          child: CartPage(),
        );
      },
    ),

    GoRoute(
      path: RoutePaths.shopDetail,
      name: RouteNames.shopDetail,
      builder: (context, state) {
        return BlocProvider<SearchProductAllBloc>(
          create: (_) => SearchProductAllBloc(sl<SearchProductUseCase>()),
          child: ShopDetail(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.shoppingPage,
      name: RouteNames.shopping,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<SearchProductAllBloc>(
              create: (_) => SearchProductAllBloc(sl<SearchProductUseCase>()),
            ),
            BlocProvider<VoucherBloc>(
              create: (_) => VoucherBloc(voucherUseCase: sl<VoucherUseCase>()),
            ),
          ],
          child: Shopping(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.admin,
      name: RouteNames.admin,
      builder: (context, state) => AdminPage(),
    ),
    GoRoute(
      path: RoutePaths.account,
      name: RouteNames.account,
      builder: (context, state) => Accounts(),
    ),
    GoRoute(
      path: RoutePaths.edit,
      name: RouteNames.edit,
      builder: (context, state) {
        return BlocProvider<ImportBloc>(
          create: (_) => ImportBloc(importUseCase: sl<ImportUseCase>()),
          child: Edit(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.manager,
      name: RouteNames.manager,
      builder: (context, state) => Management(),
    ),
    GoRoute(
      path: RoutePaths.revenue,
      name: RouteNames.revenue,
      builder: (context, state) => Revenue(),
    ),
    GoRoute(
      path: RoutePaths.employee,
      name: RouteNames.employee,
      builder: (context, state) => EmployeePage(),
    ),
    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: RoutePaths.productDetail,
      name: RouteNames.productDetail,
      builder: (context, state) {
        final extra = state.extra;
        if (extra == null || extra is! int) {
          return Scaffold(
            appBar: AppBar(title: const Text('Chi tiết sản phẩm')),
            body: const Center(child: Text(' sản phẩm bị lỗi ')),
          );
        }
        final productID = extra;
        return MultiBlocProvider(
          providers: [
            BlocProvider<ProductDetailBloc>(
              create: (_) => ProductDetailBloc(
                searchProductUseCase: sl<SearchProductUseCase>(),
              ),
            ),
            BlocProvider<AddProductToCartBloc>(
              create: (_) => AddProductToCartBloc(
                getFullOptions: sl<OptionValueUseCase>(),
                addToCart: sl<CreateCartItemUseCase>(),
                getAll: sl<GetAllCartItemUseCase>(),
              ),
            ),
            BlocProvider<SearchProductNameBloc>(
              create: (_) => SearchProductNameBloc(sl<SearchProductUseCase>()),
            ),
          ],
          child: ProductDetailPage(productID: productID),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.productDetailAd,
      name: RouteNames.productDetailAd,
      builder: (context, state) {
        final extra = state.extra;
        if (extra == null || extra is! Product) {
          return Scaffold(
            appBar: AppBar(title: const Text('Chi tiết sản phẩm')),
            body: const Center(child: Text(' sản phẩm bị lỗi ')),
          );
        }
        final product = extra;
        return MultiBlocProvider(
          providers: [
            BlocProvider<ProductDetailBloc>(
              create: (_) => ProductDetailBloc(
                searchProductUseCase: sl<SearchProductUseCase>(),
              ),
            ),
            BlocProvider<AddProductToCartBloc>(
              create: (_) => AddProductToCartBloc(
                getFullOptions: sl<OptionValueUseCase>(),
                addToCart: sl<CreateCartItemUseCase>(),
                getAll: sl<GetAllCartItemUseCase>(),
              ),
            ),
            BlocProvider<SearchProductNameBloc>(
              create: (_) => SearchProductNameBloc(sl<SearchProductUseCase>()),
            ),
          ],
          child: ProductDetailADPage(product: product),
        );
      },
    ),

    //resetpasspage
    GoRoute(
      path: RoutePaths.resetPass,
      name: RouteNames.resetPass,
      builder: (context, state) {
        return BlocProvider<RegisterBloc>(
          create: (_) => RegisterBloc(registerUser: sl<RegisterUser>()),
          child: ResetPassPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.register,
      name: RouteNames.register,
      builder: (context, state) {
        return BlocProvider<RegisterBloc>(
          create: (_) => RegisterBloc(registerUser: sl<RegisterUser>()),
          child: RegisterPage(),
        );
      },
    ),
    //otpPage
    GoRoute(
      path: RoutePaths.otp,
      name: RouteNames.otp,
      builder: (context, state) {
        final data = state.extra as Map<String, dynamic>;
        return BlocProvider<RegisterBloc>(
          create: (_) => RegisterBloc(registerUser: sl<RegisterUser>()),
          child: OtpPage(
            email: data['email'],
            username: data['username'],
            password: data['password'],
          ),
        );
      },
    ),
    //naiboxpage
    GoRoute(
      path: RoutePaths.nailBox,
      name: RouteNames.nailBox,
      builder: (context, state) {
        return BlocProvider<SearchProductCategoryBloc>(
          create: (_) => SearchProductCategoryBloc(sl<SearchProductUseCase>()),
          child: NailBoxPage(category: 3),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.nail,
      name: RouteNames.nail,
      builder: (context, state) {
        return BlocProvider<SearchProductCategoryBloc>(
          create: (_) => SearchProductCategoryBloc(sl<SearchProductUseCase>()),
          child: NailPage(category: 2),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.device,
      name: RouteNames.device,
      builder: (context, state) {
        return BlocProvider<SearchProductCategoryBloc>(
          create: (_) => SearchProductCategoryBloc(sl<SearchProductUseCase>()),
          child: DevicePage(category: 1),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.productNailBoxAd,
      name: RouteNames.productNailBoxAd,
      builder: (context, state) {
        return BlocProvider<SearchProductCategoryBloc>(
          create: (_) => SearchProductCategoryBloc(sl<SearchProductUseCase>()),
          child: ProductNailBoxADPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.productDeviceAd,
      name: RouteNames.productDeviceAd,
      builder: (context, state) {
        return BlocProvider<SearchProductCategoryBloc>(
          create: (_) => SearchProductCategoryBloc(sl<SearchProductUseCase>()),
          child: ProductDeviceADPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.productNailAd,
      name: RouteNames.productNailAd,
      builder: (context, state) {
        return BlocProvider<SearchProductCategoryBloc>(
          create: (_) => SearchProductCategoryBloc(sl<SearchProductUseCase>()),
          child: ProductNailADPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.chatPage,
      name: RouteNames.chatPage,
      builder: (context, state) => ChatPage(),
    ),
    GoRoute(
      path: RoutePaths.getPointDaily,
      name: RouteNames.getPointDaily,
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<GetPointBloc>(
              create: (_) => GetPointBloc(pointUseCase: sl<PointUseCase>()),
            ),
            BlocProvider<SearchProductAllBloc>(
              create: (_) => SearchProductAllBloc(sl<SearchProductUseCase>()),
            ),
          ],
          child: PointPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.nailSample,
      name: RouteNames.nailSample,
      builder: (context, state) {
        return BlocProvider<SearchProductCategoryBloc>(
          create: (_) => SearchProductCategoryBloc(sl<SearchProductUseCase>()),
          child: NailSamplePage(category: 4),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.appointment,
      name: RouteNames.appointment,
      builder: (context, state) => AppointmentPage(),
    ),
    GoRoute(
      path: RoutePaths.voucher,
      name: RouteNames.voucher,
      builder: (context, state) {
        return BlocProvider<VoucherBloc>(
          create: (_) => VoucherBloc(voucherUseCase: sl<VoucherUseCase>()),
          child: VoucherPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.spending,
      name: RouteNames.spending,
      builder: (context, state) {
        return BlocProvider<GetSpendingBloc>(
          create: (_) =>
              GetSpendingBloc(spendingUseCase: sl<SpendingUseCase>()),
          child: SpendingPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.spendingDetail,
      name: RouteNames.spendingDetail,
      builder: (context, state) {
        return BlocProvider<GetSpendingBloc>(
          create: (_) =>
              GetSpendingBloc(spendingUseCase: sl<SpendingUseCase>()),
          child: SpendingDetailPage(),
        );
      },
    ),

    GoRoute(
      path: RoutePaths.userDetail,
      builder: (context, state) {
        return BlocProvider<SearchProductAllBloc>(
          create: (_) => SearchProductAllBloc(sl<SearchProductUseCase>()),
          child: UserDetail(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.updateProfile,
      builder: (context, state) => UpdateProfile(),
    ),
    GoRoute(
      path: RoutePaths.editAddress,
      builder: (context, state) {
        return BlocProvider<EditAddressBloc>(
          create: (_) => EditAddressBloc(addressUseCase: sl<AddressUseCase>()),
          child: const EditAddressPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.editDetailAddress,
      builder: (context, state) {
        return BlocProvider<EditAddressBloc>(
          create: (_) => EditAddressBloc(addressUseCase: sl<AddressUseCase>()),
          child: const EditDetailAddressPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.confirmOrder,
      builder: (context, state) {
        return BlocProvider<FetchOrderBloc>(
          create: (_) => FetchOrderBloc(
            orderUseCase: sl<OrderUseCase>(),
            addressUseCase: sl<AddressUseCase>(),
            voucherUseCase: sl<VoucherUseCase>(),
            pointUseCase: sl<PointUseCase>(),
            cartItemUseCase: sl<GetAllCartItemUseCase>(),
            deleteCartItemUseCase: sl<DeleteCartItemUseCase>(),
          ),
          child: const ConfirmOrderPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.loadAddress,
      name: RouteNames.loadAddress,
      builder: (context, state) {
        final extra = state.extra;
        if (extra is FetchOrderBloc) {
          // reuse instance passed via extra
          return BlocProvider.value(
            value: extra,
            child: const LoadAddressPage(),
          );
        }
        // fallback: if there's already a FetchOrderBloc in the context, reuse it
        try {
          final existing = context.read<FetchOrderBloc>();
          return BlocProvider.value(
            value: existing,
            child: const LoadAddressPage(),
          );
        } catch (_) {
          // last resort: create a new one (use service locator)
          return BlocProvider(
            create: (_) => FetchOrderBloc(
              orderUseCase: sl<OrderUseCase>(),
              addressUseCase: sl<AddressUseCase>(),
              voucherUseCase: sl<VoucherUseCase>(),
              pointUseCase: sl<PointUseCase>(),
              cartItemUseCase: sl<GetAllCartItemUseCase>(),
              deleteCartItemUseCase: sl<DeleteCartItemUseCase>(),
            ),
            child: const LoadAddressPage(),
          );
        }
      },
    ),

    GoRoute(
      path: RoutePaths.loadVoucher,
      name: RouteNames.loadVoucher,
      builder: (context, state) {
        final extra = state.extra;
        if (extra is FetchOrderBloc) {
          return BlocProvider.value(
            value: extra,
            child: const LoadVoucherPage(),
          );
        }
        try {
          final existing = context.read<FetchOrderBloc>();
          return BlocProvider.value(
            value: existing,
            child: const LoadVoucherPage(),
          );
        } catch (_) {
          return BlocProvider(
            create: (_) => FetchOrderBloc(
              orderUseCase: sl<OrderUseCase>(),
              addressUseCase: sl<AddressUseCase>(),
              voucherUseCase: sl<VoucherUseCase>(),
              pointUseCase: sl<PointUseCase>(),
              cartItemUseCase: sl<GetAllCartItemUseCase>(),
              deleteCartItemUseCase: sl<DeleteCartItemUseCase>(),
            ),
            child: const LoadVoucherPage(),
          );
        }
      },
    ),
    GoRoute(
      path: RoutePaths.successOrder,
      builder: (context, state) {
        return const SuccessOrderPage();
      },
    ),
    GoRoute(
      path: RoutePaths.spendingOrder,
      name: RouteNames.spendingOrder,
      builder: (context, state) {
        return BlocProvider(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const OrderSpendingPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.spendingOrderDetail,
      name: RouteNames.spendingOrderDetail,
      builder: (context, state) {
        final orderId = state.extra as int? ?? 0; // default = 0 nếu null

        return BlocProvider(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: OrderSpendingDetailPage(orderId: orderId),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.transportOrder,
      name: RouteNames.transportOrder,
      builder: (context, state) {
        return BlocProvider<ManageOrderBloc>(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const OrderTransportPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.transportOrderDetail,
      name: RouteNames.transportOrderDetail,
      builder: (context, state) {
        final orderId = state.extra as int? ?? 0; // default = 0 nếu null

        return BlocProvider(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: OrderTransportDetailPage(orderId: orderId),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.waiting,
      name: RouteNames.waiting,
      builder: (context, state) {
        return BlocProvider<ManageOrderBloc>(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const OrderConfirmPageAD(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.waitingDetail,
      name: RouteNames.waitingDetail,
      builder: (context, state) {
        final orderId = state.extra as int? ?? 0; // default = 0 nếu null

        return BlocProvider(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: OrderConfirmDetailPage(orderId: orderId),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.completeOrder,
      name: RouteNames.completeOrder,
      builder: (context, state) {
        return BlocProvider<ManageOrderBloc>(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const OrderCompletePage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.completeOrderDetail,
      name: RouteNames.completeOrderDetail,
      builder: (context, state) {
        final orderId = state.extra as int? ?? 0; // default = 0 nếu null

        return BlocProvider(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: OrderCompleteDetailPage(orderId: orderId),
        );
      },
    ),
    //cancel
    GoRoute(
      path: RoutePaths.cancelOrderDetail,
      name: RouteNames.cancelOrderDetail,
      builder: (context, state) {
        return BlocProvider<ManageOrderBloc>(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const OrderCancelPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.cancelOrderDetailPage,
      name: RouteNames.cancelOrderDetailPage,
      builder: (context, state) {
        final orderId = state.extra as int? ?? 0; // default = 0 nếu null

        return BlocProvider(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: OrderCancelDetailPage(orderId: orderId),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.waitingCustomer,
      name: RouteNames.waitingCustomer,
      builder: (context, state) {
        return BlocProvider<GetOrderBloc>(
          create: (_) => GetOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const WaitConfirm_Cs_Page(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.confirmCustomer,
      name: RouteNames.confirmCustomer,
      builder: (context, state) {
        return BlocProvider<GetOrderBloc>(
          create: (_) => GetOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const Confirm_Cs_Page(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.transportCustomer,
      name: RouteNames.transportCustomer,
      builder: (context, state) {
        return BlocProvider<GetOrderBloc>(
          create: (_) => GetOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const Transport_Cs_Page(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.completeCustomer,
      name: RouteNames.completeCustomer,
      builder: (context, state) {
        return BlocProvider<GetOrderBloc>(
          create: (_) => GetOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const Complete_Cs_Page(),
        );
      },
    ),

    GoRoute(
      path: RoutePaths.cancelCustomer,
      name: RouteNames.cancelCustomer,
      builder: (context, state) {
        return BlocProvider<GetOrderBloc>(
          create: (_) => GetOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: const Cancel_Cs_Page(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.orderDetailCsPage,
      name: RouteNames.orderDetailCsPage,
      builder: (context, state) {
        final extra = state.extra;
        if (extra == null || extra is! Order) {
          return Scaffold(
            appBar: AppBar(title: const Text('Chi tiết đơn hàng')),
            body: const Center(child: Text('Thiếu tham số order')),
          );
        }
        final order = extra as Order;

        return BlocProvider<ManageOrderBloc>(
          create: (_) => ManageOrderBloc(orderUseCase: sl<OrderUseCase>()),
          child: OrderDetail_cs_Page(order: order),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.getVoucherAd,
      name: RouteNames.getVoucherAd,
      builder: (context, state) {
        return BlocProvider<ManageVoucherBloc>(
          create: (_) =>
              ManageVoucherBloc(voucherUseCase: sl<VoucherUseCase>()),
          child: GetVoucherPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.updateVoucherAd,
      name: RouteNames.updateVoucherAd,
      builder: (context, state) {
        final extra = state.extra;
        if (extra == null || extra is! Voucher) {
          return Scaffold(
            appBar: AppBar(title: const Text('Cập nhật voucher')),
            body: const Center(child: Text('Thiếu tham số voucher')),
          );
        }
        final voucher = extra as Voucher;

        return BlocProvider<ManageVoucherBloc>(
          create: (_) =>
              ManageVoucherBloc(voucherUseCase: sl<VoucherUseCase>()),
          child: UpdateVoucherPage(voucher: voucher),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.createVoucherAd,
      name: RouteNames.createVoucherAd,
      builder: (context, state) {
        return BlocProvider<ManageVoucherBloc>(
          create: (_) =>
              ManageVoucherBloc(voucherUseCase: sl<VoucherUseCase>()),
          child: CreateVoucherPage(),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.productNewAd,
      name: RouteNames.productNewAd,
      builder: (context, state) => NewProductPage(),
    ),
    GoRoute(
      path: RoutePaths.productSoldOutAd,
      name: RouteNames.productSoldOutAd,
      builder: (context, state) => SoldOutPage(),
    ),
    GoRoute(
      path: RoutePaths.productStockAd,
      name: RouteNames.productStockAd,
      builder: (context, state) => StockPage(),
    ),
    GoRoute(
      path: RoutePaths.productTrendingAd,
      name: RouteNames.productTrendingAd,
      builder: (context, state) => TrendingPage(),
    ),
    GoRoute(
      path: RoutePaths.productBestSeltAd,
      name: RouteNames.productBestSeltAd,
      builder: (context, state) => BestSellerPage(),
    ),
  ],
);
