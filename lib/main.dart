import 'package:flutter/material.dart';
import 'package:nailxinh/domain/usecases/get_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bloc/user_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'domain/usecases/login_usecase.dart';
import 'blocs/bloc/auth_bloc.dart';
import 'blocs/bloc/role_bloc.dart';
import 'domain/usecases/get_role.dart';
import 'domain/usecases/refreshToken_usecase.dart';
import 'domain/usecases/logout_usecase.dart';

import 'package:nailxinh/routers/router.dart';
import 'package:nailxinh/core/dependency_injection/service_locator.dart';
import 'package:nailxinh/features/fetch_profile/fetch_profile_bloc.dart';
import 'package:nailxinh/domain/usecases/customer_usecase.dart';
//dio

Future<void> main() async {
  await initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(getUsers: sl<GetUsers>()),
        ),

        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            logoutUsecase: sl<LogoutUsecase>(),
            loginUsecase: sl<LoginUsecase>(),
            storage: sl<FlutterSecureStorage>(),
            getRoleUseCase: sl<GetRoleUseCase>(),
            refreshTokenUseCase: sl<RefreshTokenUseCase>(),
          ),
        ),
        BlocProvider<RoleBloc>(
          create: (context) => RoleBloc(getRoleUseCase: sl<GetRoleUseCase>()),
        ),
        BlocProvider<FetchProfileBloc>(
          create: (_) =>
              FetchProfileBloc(customerUseCase: sl<CustomerUseCase>()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'User Demo',
        theme: ThemeData(primarySwatch: Colors.blue),

        routerConfig: router,
      ),
    );
  }
}
