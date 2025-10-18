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
import '../ui/pages/customerPages/cart_page.dart';
import '../ui/pages/customerPages/user_detail.dart';
import '../ui/pages/customerPages/shop_detail.dart';

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
//employee
import '../ui/pages/employeePages/employee_page.dart';
//getit
import 'package:get_it/get_it.dart';
import '../core/dependency_injection/service_locator.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc/auth_bloc.dart';
import '../blocs/bloc/user_bloc.dart';
import '../blocs/bloc/role_bloc.dart';
import '../blocs/bloc/register_bloc.dart';
import '../blocs/bloc/product_bloc/search_all.dart';
import '../blocs/bloc/storage_search_history/storage_search_history_bloc.dart';
import '../blocs/bloc/storage_search_history/suggestion_history_bloc.dart';
import '../blocs/bloc/product_bloc/search_product_name_bloc.dart';
import '../features/fetch_detail_product/bloc.dart';

//usecase
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/get_role.dart';
import '../domain/usecases/refreshToken_usecase.dart';
import '../domain/usecases/logout_usecase.dart';
import '../domain/usecases/check_user.dart';
import '../domain/usecases/register_user.dart';
import '../domain/usecases/get_user.dart';
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
        final keyword = state.uri.queryParameters['keyword'] ?? '';

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
      builder: (context, state) => Booking(),
    ),
    GoRoute(
      path: RoutePaths.order,
      name: RouteNames.order,
      builder: (context, state) => OrderHistory(),
    ),
    GoRoute(
      path: RoutePaths.cart,
      name: RouteNames.cart,
      builder: (context, state) => CartPage(),
    ),
    GoRoute(
      path: RoutePaths.userDetail,
      name: RouteNames.userDetail,
      builder: (context, state) => UserDetail(),
    ),
    GoRoute(
      path: RoutePaths.shopDetail,
      name: RouteNames.shopDetail,

      builder: (context, state) {
        return ShopDetail();
      },
    ),
    GoRoute(
      path: RoutePaths.shoppingPage,
      name: RouteNames.shopping,
      builder: (context, state) {
        return BlocProvider<SearchProductAllBloc>(
          create: (_) => SearchProductAllBloc(sl<SearchProductUseCase>()),
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
      builder: (context, state) => Edit(),
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
        if (extra is! Product) {
          return Scaffold(
            appBar: AppBar(title: const Text('Chi tiết sản phẩm')),
            body: const Center(child: Text(' sản phẩm bị lỗi ')),
          );
        }
        final product = extra as Product;
        return BlocProvider<ProductDetailBloc>(
          create: (_) => ProductDetailBloc(
            searchProductUseCase: sl<SearchProductUseCase>(),
          ),
          child: ProductDetailPage(product: product),
        );
      },
    ),
    GoRoute(
      path: RoutePaths.cartPage,
      name: RouteNames.cartPage,
      builder: (context, state) {
        return CartPage();
      },
    ),
  ],
);
