import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/ui/widgets/button/button_gradient.dart';
import 'package:nailxinh/ui/widgets/textfill/textFillResetPass.dart';
import '../../../blocs/bloc/register_bloc.dart';
import '../../../blocs/evens/register_event.dart';
import '../../../blocs/states/register_state.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import 'login_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ResetPassPage extends StatefulWidget {
  const ResetPassPage({Key? key}) : super(key: key);

  @override
  State<ResetPassPage> createState() => _ResetPassPageState();
}

class _ResetPassPageState extends State<ResetPassPage> {
  final emailCtrl = TextEditingController();
  final otpCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final repasswordCtrl = TextEditingController();

  bool isOtpSent = false;
  bool isFormValid = false;
  bool isLoading = false;

  String? emailError, otpError, passwordError, repasswordError;

  void _validateForm() {
    setState(() {
      isFormValid =
          (emailError == null &&
          (isOtpSent
              ? otpError == null &&
                    passwordError == null &&
                    repasswordError == null
              : true));
    });
  }

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
          "Đặt Lại Mật Khẩu",
          style: TextStyle(color: MyColor.textColor, fontSize: 22),
        ),
        backgroundColor: Colors.transparent, // Nền trong suốt
        elevation: 0,
      ),
      // Thêm vào Scaffold:
      extendBodyBehindAppBar: true,
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is SendOtpLoading) {
            setState(() => isLoading = true);
          } else if (state is SendOtpSuccess) {
            setState(() {
              isOtpSent = true;
              isLoading = false;
            });
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Đã gửi mã OTP!")));
          } else if (state is SendOtpFailure) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Gửi mã thất bại: ${state.error}")),
            );
          } else if (state is VerifyOtpSuccess) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("xác thực otp thành công!")),
            );
            context.read<RegisterBloc>().add(
              ResetPassEvent(
                email: emailCtrl.text,
                password: passwordCtrl.text,
                resetpassToken: state.token,
              ),
            );
          } else if (state is ResetPassSuccess) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Đặt lại mật khẩu thành công!")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          } else if (state is ResetPassFailure) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Lỗi: ${state.error}")));
          } else if (state is VerifyOtpFailure) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Xác thực mã OTP thất bại: ${state.error}"),
              ),
            );
          } else if (state is VerifyOtpLoading) {
            setState(() => isLoading = true);
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(gradient: MyColor.colorbackground),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 200),
                      TextFillResetPass(
                        label: "Email",
                        controller: emailCtrl,
                        errorText: emailError,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              emailError = "Vui lòng nhập email";
                            } else if (!RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            ).hasMatch(value)) {
                              emailError = "Email không hợp lệ";
                            } else {
                              emailError = null;
                            }
                            _validateForm();
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      ButtonGradient(
                        text: "Gửi mã",
                        height: 48,
                        gradient: MyColor.colorbackground,
                        onPressed: (emailError != null || isLoading)
                            ? null
                            : () {
                                context.read<RegisterBloc>().add(
                                  SendOtpEvent(emailCtrl.text),
                                );
                              },
                      ),
                      const SizedBox(height: 24),
                      if (isOtpSent) ...[
                        TextFillResetPass(
                          label: "Mã OTP",
                          controller: otpCtrl,
                          errorText: otpError,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              otpError = value.isEmpty
                                  ? "Vui lòng nhập mã OTP"
                                  : null;
                              _validateForm();
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFillResetPass(
                          label: "Mật khẩu mới",
                          controller: passwordCtrl,
                          errorText: passwordError,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                passwordError = "Vui lòng nhập mật khẩu";
                              } else if (value.length < 6) {
                                passwordError = "Mật khẩu phải từ 6 ký tự";
                              } else {
                                passwordError = null;
                              }
                              _validateForm();
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFillResetPass(
                          label: "Nhập lại mật khẩu",
                          controller: repasswordCtrl,
                          errorText: repasswordError,
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                repasswordError = "Vui lòng nhập lại mật khẩu";
                              } else if (value != passwordCtrl.text) {
                                repasswordError = "Mật khẩu không khớp";
                              } else {
                                repasswordError = null;
                              }
                              _validateForm();
                            });
                          },
                        ),
                        const SizedBox(height: 24),
                        ButtonGradient(
                          text: "Xác nhận",
                          height: 48,
                          gradient:
                              (otpError != null ||
                                  passwordError != null ||
                                  repasswordError != null ||
                                  isLoading)
                              ? LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 78, 74, 74),
                                    const Color.fromARGB(255, 78, 74, 74),
                                  ],
                                )
                              : MyColor.mainGradient,
                          onPressed:
                              (otpError != null ||
                                  passwordError != null ||
                                  repasswordError != null ||
                                  isLoading)
                              ? null
                              : () {
                                  context.read<RegisterBloc>().add(
                                    VerifyOtpEvent(
                                      emailCtrl.text,
                                      otpCtrl.text,
                                    ),
                                  );
                                },
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
