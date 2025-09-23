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
        RepositoryProvider<RegisterUser>(
          create: (ctx) => RegisterUser(ctx.read<AuthRepository>()),
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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RegisterBloc>(
            create: (context) =>
                RegisterBloc(registerUser: context.read<RegisterUser>()),
          ),
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
