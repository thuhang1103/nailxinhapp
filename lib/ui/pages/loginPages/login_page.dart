import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/blocs/bloc/auth_bloc.dart';
import 'package:nailxinh/blocs/evens/auth_event.dart';
import 'package:nailxinh/blocs/states/auth_state.dart';
import 'package:nailxinh/ui/pages/adminPages/admin_page.dart';
import 'package:nailxinh/ui/pages/customerPages/myhome_page.dart';
import 'package:nailxinh/ui/pages/employeePages/employee_page.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import 'package:nailxinh/ui/widgets/textfill/customTextFormFill.dart';
import 'package:nailxinh/ui/widgets/button/button_gradient.dart';
import './register_page.dart';
import '../../../blocs/bloc/register_bloc.dart';
import '../../../blocs/evens/register_event.dart';
import '../../../blocs/states/register_state.dart';
import '../../../domain/usecases/register_user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nailxinh/ui/pages/loginPages/resetPass_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // AppBar đè lên body
      appBar: AppBar(
        title: const Text(
          "Đăng nhập",
          style: TextStyle(color: MyColor.textColor), // Màu chữ
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // Đổi icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MyHomePage()),
            );
          },
        ),
        backgroundColor: Colors.transparent, // Nền trong suốt
        elevation: 0, // Không bóng đổ
        iconTheme: const IconThemeData(
          color: MyColor.textColor,
        ), // Màu icon (nếu có)
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            switch (state.role) {
              case "Admin":
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => AdminPage()),
                );
                break;
              case "Staff":
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => EmployeePage()),
                );
                break;
              case "Customer":
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => MyHomePage()),
                );
                break;
            }
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Container(
              decoration: BoxDecoration(gradient: MyColor.colorbackground),
              alignment: Alignment.center,
              child: const SpinKitFadingCircle(
                color: Color.fromARGB(255, 83, 81, 81),
                size: 40.0,
              ),
            );
          }
          return Container(
            decoration: BoxDecoration(gradient: MyColor.colorbackground),
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                const SizedBox(height: 150),
                CustomTextFormField(
                  label: 'Username',
                  controller: _usernameController,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  label: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ButtonGradient(
                  text: 'Đăng nhập',
                  onPressed: () {
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    context.read<AuthBloc>().add(
                      LoginRequested(username, password),
                    );
                    // Xử lý đăng nhập
                  },
                  width: double.infinity,
                  height: 48,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => RegisterBloc(
                              registerUser: context.read<RegisterUser>(),
                            ),
                            child: const ResetPassPage(),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Quên mật khẩu?',
                      style: TextStyle(
                        color: MyColor.textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(height: 1, color: MyColor.textColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "hoặc",
                        style: TextStyle(
                          color: MyColor.textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(height: 1, color: MyColor.textColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Chưa có tài khoản?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 112, 108, 110),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BlocProvider(
                              create: (_) => RegisterBloc(
                                registerUser: context.read<RegisterUser>(),
                              ),
                              child: const RegisterPage(),
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Đăng ký",
                        style: TextStyle(
                          color: Color.fromARGB(
                            255,
                            227,
                            9,
                            9,
                          ), // hoặc MyColor.textColor nếu muốn
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
