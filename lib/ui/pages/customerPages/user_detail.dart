import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/auth_bloc.dart';
import '../../../blocs/evens/auth_event.dart';
import '../../../blocs/states/auth_state.dart';
import 'package:go_router/go_router.dart';
import '../../../routers/router_path.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is! Authenticated) {
          context.go(RoutePaths.login);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Thông tin tài khoản')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ... các thông tin user khác ...
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(LogoutRequested());
                },
                child: Text('Đăng xuất'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
