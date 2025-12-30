import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/blocs/bloc/auth_bloc.dart';

import 'package:nailxinh/blocs/evens/auth_event.dart';
import '../../../blocs/states/auth_state.dart';
import 'package:go_router/go_router.dart';
import '../../../routers/router_path.dart';

import '../../../routers/router.dart';

class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          context.go(RoutePaths.home);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          title: const Text(
            'Admin NailXinh',
            style: TextStyle(
              color: MyColor.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container 1: Thông tin Admin
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thông tin Admin',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColor.textColor,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.pink[100],
                          child: const Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.pink,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'thuhang',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MyColor.textColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'admin@nailxinh.com',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Action đổi mật khẩu
                        },
                        icon: const Icon(Icons.lock_reset, color: Colors.white),
                        label: const Text(
                          'Đổi mật khẩu',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[400],
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Action đăng xuất
                          context.read<AuthBloc>().add(LogoutRequested());
                        },
                        icon: const Icon(Icons.logout, color: Colors.white),
                        label: const Text(
                          'Đăng Xuất',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink[400],
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Container 2: Danh sách địa chỉ cửa hàng
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Địa chỉ cửa hàng',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: MyColor.textColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            // Action thêm địa chỉ mới
                          },
                          icon: const Icon(Icons.add, color: Colors.pink),
                          tooltip: 'Thêm địa chỉ',
                        ),
                      ],
                    ),
                    const Divider(),
                    // Danh sách địa chỉ
                    _buildAddressItem(
                      'Cửa hàng chính',
                      '123 Đường Lê Lợi, Quận 1, TP.HCM',
                      '08:00 - 22:00',
                      true,
                    ),
                    _buildAddressItem(
                      'Chi nhánh 2',
                      '456 Nguyễn Trãi, Quận 5, TP.HCM',
                      '09:00 - 21:00',
                      false,
                    ),
                    _buildAddressItem(
                      'Chi nhánh 3',
                      '789 Hai Bà Trưng, Quận 3, TP.HCM',
                      '10:00 - 20:00',
                      false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAddressItem(
    String name,
    String address,
    String hours,
    bool isPrimary,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isPrimary ? Colors.pink : Colors.grey[300]!,
          width: isPrimary ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isPrimary ? Colors.pink[100] : Colors.blue[50],
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(
              Icons.store,
              color: isPrimary ? Colors.pink : Colors.blue,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: MyColor.textColor,
                      ),
                    ),
                    if (isPrimary)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'Chính',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink[800],
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 2),
                Text(
                  hours,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Action edit địa chỉ
            },
            icon: const Icon(Icons.edit, color: Colors.pink),
            tooltip: 'Chỉnh sửa',
          ),
        ],
      ),
    );
  }
}
