import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/blocs/bloc/register_bloc.dart';
import 'package:nailxinh/blocs/evens/register_event.dart';
import 'package:nailxinh/blocs/states/register_state.dart';
import 'package:nailxinh/core/color/mycolor.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailCtrl = TextEditingController();
  final otpCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  String? registrationToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: MyColor.textColor,
          ), // Đổi icon và màu
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
        ),
        title: const Text(
          "Đăng ký",
          style: TextStyle(color: MyColor.textColor, fontSize: 22),
        ),
        backgroundColor: Colors.transparent, // Nền trong suốt
        elevation: 0,
      ),
      // Thêm vào Scaffold:
      extendBodyBehindAppBar: true,
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) async {
          if (state is SendOtpSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            // Hiện popup nhập OTP
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text("Nhập mã OTP"),
                  content: TextField(
                    controller: otpCtrl,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: const InputDecoration(
                      labelText: "OTP",
                      counterText: "",
                    ),
                  ),
                  actions: [
                    BlocBuilder<RegisterBloc, RegisterState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state is VerifyOtpLoading
                              ? null
                              : () {
                                  context.read<RegisterBloc>().add(
                                    VerifyOtpEvent(
                                      emailCtrl.text,
                                      otpCtrl.text,
                                    ),
                                  );
                                },
                          child: state is VerifyOtpLoading
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text("Xác nhận"),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          } else if (state is VerifyOtpSuccess) {
            registrationToken = state.token;
            Navigator.of(context).pop(); // Tắt popup OTP
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is RegisterSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            Navigator.pop(context, true);
          } else if (state is SendOtpFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is VerifyOtpFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                TextField(
                  controller: emailCtrl,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: usernameCtrl,
                  decoration: const InputDecoration(labelText: "Tên đăng nhập"),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: passwordCtrl,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Mật khẩu"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: state is SendOtpLoading
                      ? null
                      : () {
                          context.read<RegisterBloc>().add(
                            SendOtpEvent(emailCtrl.text),
                          );
                        },
                  child: state is SendOtpLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text("Tiếp tục"),
                ),
                const SizedBox(height: 20),
                // Chỉ hiện nút đăng ký khi đã verify OTP thành công
                if (registrationToken != null)
                  ElevatedButton(
                    onPressed: state is RegisterLoading
                        ? null
                        : () {
                            context.read<RegisterBloc>().add(
                              RegisterCustomerEvent(
                                email: emailCtrl.text,
                                password: passwordCtrl.text,
                                username: usernameCtrl.text,
                                registrationToken: registrationToken!,
                              ),
                            );
                          },
                    child: state is RegisterLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Đăng ký"),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
