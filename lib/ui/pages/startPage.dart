import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/bloc/auth_bloc.dart';
import '../../blocs/states/auth_state.dart';
import '../../blocs/evens/auth_event.dart';
import 'package:go_router/go_router.dart';
import '../../routers/router.dart';
import '../../routers/router_name.dart';
import '../../routers/router_path.dart';

class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          // Điều hướng theo role
          if (state.role == 'Admin') {
            context.go(RoutePaths.admin);
          } else if (state.role == 'Staff') {
            context.go(RoutePaths.employee);
          } else if (state.role == 'Customer') {
            print('Navigating to home for Customer');
            context.go(RoutePaths.home);
          }
        } else if (state is Unauthenticated) {
          // Trang customer chưa đăng nhập
          context.go(RoutePaths.home);
        } else if (state is TokenExpired) {
          context.read<AuthBloc>().add(LogoutRequested());
          context.go(RoutePaths.home);
        }
      },
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
