import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:nailxinh/blocs/bloc/register_bloc.dart';
import 'package:nailxinh/blocs/evens/register_event.dart';
import 'package:nailxinh/blocs/states/register_state.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import 'package:nailxinh/ui/widgets/text/text_appbar.dart';
import 'package:nailxinh/ui/widgets/button/button_gradient.dart';
import './login_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OtpPage extends StatefulWidget {
  final String email;
  final String username;
  final String password;
  final String? registrationToken;

  OtpPage({
    super.key,
    required this.email,
    required this.username,
    required this.password,
    this.registrationToken,
  });

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String currentOtp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: MyColor.textColor,
          ), // Đổi màu và kích thước icon
          onPressed: () => Navigator.pop(context),
        ),
        title: TitleText(text: "Nhập Mã Xác Thực"),
        backgroundColor: Colors.transparent, // Đổi màu nền AppBar nếu muốn
        elevation: 0,
      ),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is VerifyOtpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Xác thực thành công!")),
            );
            context.read<RegisterBloc>().add(
              RegisterCustomerEvent(
                email: widget.email,
                username: widget.username,
                password: widget.password,
                registrationToken: state.token,
              ),
            );
          } else if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Đăng ký tài khoản thành công!\n Vui lòng đăng nhập lại",
                ),
              ),
            );
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            });
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Đăng kí tài khoản thất bại, hãy thử lại"),
              ),
            );
          } else if (state is VerifyOtpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Xác thực mã OTP thất bại, hãy thử lại")),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is VerifyOtpLoading;

          return Container(
            decoration: const BoxDecoration(gradient: MyColor.colorbackground),
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Column(
              children: [
                SizedBox(height: kToolbarHeight + 100),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      const TextSpan(text: "Nhập mã OTP đã gửi tới email: "),
                      TextSpan(
                        text: widget.email,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      currentOtp = value;
                    });
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 48,
                    fieldWidth: 48,
                    activeColor: const Color.fromARGB(255, 71, 71, 70),
                    selectedColor: const Color.fromARGB(255, 125, 123, 123),
                    inactiveColor: const Color.fromARGB(255, 125, 123, 123),
                  ),
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 17, 10, 8),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 30),
                ButtonGradient(
                  text: "Xác Nhận",
                  onPressed: currentOtp.length == 6 && !isLoading
                      ? () {
                          context.read<RegisterBloc>().add(
                            VerifyOtpEvent(widget.email, currentOtp),
                          );
                        }
                      : null, // Không nhấn được khi chưa đủ điều kiện hoặc đang loading
                  height: 40,
                  gradient: currentOtp.length == 6 && !isLoading
                      ? MyColor.mainGradient
                      : LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 78, 74, 74),
                            Colors.grey.shade400,
                          ],
                        ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    context.read<RegisterBloc>().add(
                      SendOtpEvent(widget.email),
                    );
                  },
                  child: const Text("Gửi lại mã"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
