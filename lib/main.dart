import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nailxinh/datas/datasources/register_data.dart';
import 'package:nailxinh/domain/usecases/get_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/domain/usecases/register_user.dart';
import 'blocs/bloc/register_bloc.dart';
import 'blocs/bloc/user_bloc.dart';
import 'datas/datasources/user_data.dart';
import 'datas/repositoriesimpl/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/register_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'datas/repositoriesimpl/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_usecase.dart';
import 'blocs/bloc/auth_bloc.dart';
import 'datas/datasources/login_data.dart';
import 'blocs/bloc/role_bloc.dart';
import 'domain/usecases/get_role.dart';
import 'package:dio/dio.dart';
import 'datas/datasources/auth_data.dart';
import 'core/network/dio_client.dart';
import 'domain/usecases/refreshToken_usecase.dart';
import 'core/network/auth_interceptor.dart';
import 'ui/pages/startPage.dart';
import 'ui/pages/customerPages/myhome_page.dart';
import 'ui/pages/adminPages/admin_page.dart';
import 'ui/pages/EmployeePages/employee_page.dart';
import 'ui/pages/loginPages/login_page.dart';
import 'domain/usecases/logout_usecase.dart';
import 'domain/usecases/check_user.dart';
import 'domain/usecases/search_usecases/add_keyword.dart';
import 'domain/usecases/search_usecases/clear_history_search.dart';
import 'domain/usecases/search_usecases/getHistoryUsecase.dart';
import 'domain/usecases/search_usecases/search_suggestion_usecase.dart';
import 'datas/repositoriesimpl/product_repository_impl/search_suggestion_reposirory_impl.dart';
import 'domain/repositories/product_repository/search_suggestion_repository.dart';
import 'domain/repositories/search_repository.dart';
import 'datas/repositoriesimpl/search_repository_impl.dart';
import 'datas/local/search_history_storage.dart';
import 'datas/datasources/product_data/search_suggestion_data.dart';
import 'domain/usecases/product_usecase/search_product_usecase.dart';
import 'datas/repositoriesimpl/product_repository_impl/search_product_repository_impl.dart';
import 'domain/repositories/product_repository/search_product_repository.dart';
import 'datas/datasources/product_data/search_products.dart';
import 'blocs/bloc/product_bloc/search_all.dart';
import 'ui/pages/customerPages/shopping_page.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (_) => UserRepositoryImpl(UserDataImpl(http.Client())),
        ),
        RepositoryProvider<SearchHistoryRepository>(
          create: (_) => SearchHistoryRepositoryImpl(SearchHistoryStorage()),
        ),
        RepositoryProvider<SearchProductRepository>(
          create: (context) {
            final storage = const FlutterSecureStorage();
            late AuthRepositoryImpl authRepository;
            final authInterceptor = AuthInterceptor(
              storage: storage,
              getAuthRepository: () => authRepository,
            );
            final dio = DioClient.create(authInterceptor);

            authRepository = AuthRepositoryImpl(
              LoginDataImpl(dio),
              storage,
              AuthDataImpl(dio),
              RegisterDataImpl(dio),
            );

            return SearchProductRepositoryImpl(SearchProductDataImpl(dio));
          },
        ),

        RepositoryProvider<GetUsers>(
          create: (ctx) => GetUsers(ctx.read<UserRepository>()),
        ),

        RepositoryProvider<AuthRepository>(
          create: (context) {
            final storage = const FlutterSecureStorage();
            late AuthRepositoryImpl authRepository;
            final authInterceptor = AuthInterceptor(
              storage: storage,
              getAuthRepository: () => authRepository,
            );
            final dio = DioClient.create(authInterceptor);

            authRepository = AuthRepositoryImpl(
              LoginDataImpl(dio),
              storage,
              AuthDataImpl(dio),
              RegisterDataImpl(dio),
            );

            return authRepository;
          },
        ),
        RepositoryProvider<SearchSuggestionRepository>(
          create: (context) {
            final storage = const FlutterSecureStorage();
            late AuthRepositoryImpl authRepository;
            final authInterceptor = AuthInterceptor(
              storage: storage,
              getAuthRepository: () => authRepository,
            );
            final dio = DioClient.create(authInterceptor);

            authRepository = AuthRepositoryImpl(
              LoginDataImpl(dio),
              storage,
              AuthDataImpl(dio),
              RegisterDataImpl(dio),
            );

            return SearchSuggestionRepositoryImpl(
              SearchSuggestionDataImpl(dio),
            );
          },
        ),

        // Repository usecase
        RepositoryProvider<RegisterUser>(
          create: (ctx) => RegisterUser(ctx.read<AuthRepository>()),
        ),
        RepositoryProvider<CheckUserExistsUseCase>(
          create: (ctx) => CheckUserExistsUseCase(ctx.read<UserRepository>()),
        ),
        RepositoryProvider<LoginUsecase>(
          create: (ctx) => LoginUsecase(ctx.read<AuthRepository>()),
        ),
        RepositoryProvider<GetRoleUseCase>(
          create: (ctx) => GetRoleUseCase(ctx.read<AuthRepository>()),
        ),
        RepositoryProvider<LogoutUsecase>(
          create: (ctx) => LogoutUsecase(ctx.read<AuthRepository>()),
        ),
        RepositoryProvider<RefreshTokenUseCase>(
          create: (ctx) => RefreshTokenUseCase(ctx.read<AuthRepository>()),
        ),
        RepositoryProvider<SearchSuggestionUseCase>(
          create: (ctx) =>
              SearchSuggestionUseCase(ctx.read<SearchSuggestionRepository>()),
        ),
        RepositoryProvider<AddKeyword>(
          create: (ctx) => AddKeyword(ctx.read<SearchHistoryRepository>()),
        ),
        RepositoryProvider<ClearHistorySearch>(
          create: (ctx) =>
              ClearHistorySearch(ctx.read<SearchHistoryRepository>()),
        ),
        RepositoryProvider<GetSearchHistory>(
          create: (ctx) =>
              GetSearchHistory(ctx.read<SearchHistoryRepository>()),
        ),
        RepositoryProvider<SearchProductUseCase>(
          create: (ctx) =>
              SearchProductUseCase(ctx.read<SearchProductRepository>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (context) => UserBloc(getUsers: context.read<GetUsers>()),
          ),
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              logoutUsecase: context.read<LogoutUsecase>(),
              loginUsecase: context.read<LoginUsecase>(),
              storage: const FlutterSecureStorage(),
              getRoleUseCase: context.read<GetRoleUseCase>(),
              refreshTokenUseCase: context.read<RefreshTokenUseCase>(),
              // authRepository: context.read<AuthRepository>(), --- IGNORE ---
            ),
          ),
          BlocProvider<RoleBloc>(
            create: (context) =>
                RoleBloc(getRoleUseCase: context.read<GetRoleUseCase>()),
          ),
          BlocProvider(
            create: (context) =>
                SearchProductAllBloc(context.read<SearchProductUseCase>()),
            child: Shopping(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'User Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          routes: {
            '/customer': (context) => MyHomePage(),
            '/admin': (context) => AdminPage(),
            '/staff': (context) => EmployeePage(),
            '/login': (context) => LoginPage(),
            // các route khác
          },
          home: StartPage(),
        ),
      ),
    );
  }
}
