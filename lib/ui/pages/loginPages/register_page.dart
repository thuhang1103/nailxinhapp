import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import 'package:nailxinh/ui/pages/loginPages/otp_page.dart';
import 'package:nailxinh/ui/widgets/button/button_gradient.dart';
import '../../../blocs/bloc/register_bloc.dart';
import '../../../blocs/evens/register_event.dart';
import '../../../blocs/states/register_state.dart';
import '../../widgets/textfill/customTextFormFill.dart';
import '../../../domain/usecases/check_user.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailCtrl = TextEditingController();
  final repasswordCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  bool isFormValid = false;
  String? emailError;
  String? usernameError;
  String? passwordError;
  String? repasswordError;

  void _validateForm() {
    setState(() {
      isFormValid =
          (emailError == null &&
          passwordError == null &&
          usernameError == null &&
          repasswordError == null);
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
          "Đăng ký",
          style: TextStyle(color: MyColor.textColor, fontSize: 22),
        ),
        backgroundColor: Colors.transparent, // Nền trong suốt
        elevation: 0,
      ),
      // Thêm vào Scaffold:
      extendBodyBehindAppBar: true,
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is SendOtpSuccess) {
            print('đã gửi otp thành công, chuyển trang');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => BlocProvider.value(
                  value: context.read<RegisterBloc>(),
                  child: OtpPage(
                    email: emailCtrl.text,
                    username: usernameCtrl.text,
                    password: passwordCtrl.text,
                  ),
                ),
              ),
            );
          } else if (state is SendOtpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "email không tồn tại, gửi mã thất bại: ${state.error}",
                ),
              ),
            );
          } else {}
        },

        builder: (context, state) {
          final isLoading = state is SendOtpLoading;
          if (isLoading) {
            return Container(
              decoration: BoxDecoration(gradient: MyColor.colorbackground),
              alignment: Alignment.center,
              child: const SpinKitFadingCircle(
                color: Color.fromARGB(255, 83, 81, 81), // hoặc màu bạn muốn
                size: 40.0,
              ),
            );
          } else {
            return Container(
              decoration: const BoxDecoration(
                gradient: MyColor.colorbackground,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  //chiều cao tôi thiểu để tránh bị overflow khi bàn phím hiện
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 220),
                        CustomTextFormField(
                          label: "Email",
                          errorText: emailError,
                          controller: emailCtrl,
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
                        CustomTextFormField(
                          label: "Tên đăng nhập",
                          errorText: usernameError,
                          controller: usernameCtrl,
                          onChanged: (value) {
                            setState(() {
                              if (value.isEmpty) {
                                usernameError = "Vui lòng nhập tên đăng nhập";
                              } else if (value.length < 4) {
                                usernameError = "Tên đăng nhập phải từ 4 ký tự";
                              } else {
                                usernameError = null;
                              }
                              _validateForm();
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomTextFormField(
                          label: "Mật khẩu",
                          errorText: passwordError,
                          controller: passwordCtrl,
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

                        CustomTextFormField(
                          label: "Nhập lại mật khẩu",
                          errorText: repasswordError,
                          controller: repasswordCtrl,
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

                        const SizedBox(height: 32),
                        ButtonGradient(
                          text: "Tiếp tục",
                          height: 48,
                          onPressed: (!isFormValid || isLoading)
                              ? null
                              : () async {
                                  print('vào dược button ');
                                  final checkUserExists = context
                                      .read<CheckUserExistsUseCase>();
                                  final emailExists = await checkUserExists
                                      .email(emailCtrl.text);
                                  if (emailExists) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Email đã tồn tại!"),
                                      ),
                                    );
                                    return;
                                  }

                                  // Kiểm tra username tồn tại
                                  final usernameExists = await checkUserExists
                                      .username(usernameCtrl.text);
                                  if (usernameExists) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "Tên đăng nhập đã tồn tại!",
                                        ),
                                      ),
                                    );
                                    return;
                                  }
                                  context.read<RegisterBloc>().add(
                                    SendOtpEvent(emailCtrl.text),
                                  );
                                },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
