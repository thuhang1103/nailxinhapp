import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/bloc/auth_bloc.dart';
import '../../blocs/states/auth_state.dart';
import '../../blocs/evens/auth_event.dart';

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
            Navigator.pushReplacementNamed(context, '/admin');
          } else if (state.role == 'Staff') {
            Navigator.pushReplacementNamed(context, '/staff');
          } else if (state.role == 'Customer') {
            Navigator.pushReplacementNamed(context, '/customer');
          }
        } else if (state is Unauthenticated) {
          // Trang customer chưa đăng nhậpflu
          Navigator.pushReplacementNamed(context, '/customer');
        } else if (state is TokenExpired) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
