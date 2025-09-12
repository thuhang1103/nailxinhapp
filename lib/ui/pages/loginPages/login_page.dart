import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import 'package:nailxinh/ui/widgets/gradient_button.dart';
import 'package:nailxinh/ui/widgets/text_header.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
        ),
        title: TitleText( text: 'NAILXINH',),
        centerTitle: true,
        backgroundColor: MyColor.colorbackround2,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: MyColor.colorbackground
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(

            children: [
              const SizedBox(height: 32),
              const Text(
                'Đăng nhập',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Color(0xff630243)),
                textAlign: TextAlign.center,


              ),
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Tên đăng nhập',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration:  InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), ),
                ),
              ),
              const SizedBox(height: 24),
              GradientButton(
                text: 'Đăng nhập',
                onPressed: () {},
                width: 300, // Chiều rộng tùy chỉnh
              ),
              const SizedBox(height: 10),
              Container(
                height: 2,
                width: 400,
                color: Color(0xff4c0224),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Điều hướng đến trang đăng ký
                },
                child: const Text('Đăng ký',style: TextStyle(color: Colors.red),),
              ),
              const SizedBox(height: 8),
              const Text(
                'Nếu bạn chưa có tài khoản, vui lòng đăng ký tài khoản .',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xff4a4a4a)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}