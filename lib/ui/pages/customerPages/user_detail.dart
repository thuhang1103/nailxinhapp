import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/features/fetch_profile/fetch_profile_bloc.dart';
import '../../../blocs/bloc/auth_bloc.dart';
import '../../../blocs/evens/auth_event.dart';
import '../../../blocs/states/auth_state.dart';
import 'package:go_router/go_router.dart';
import '../../../routers/router_path.dart';
//color
import '../../../core/color/mycolor.dart';
import '../../../blocs/bloc/product_bloc/search_all.dart';
import '../../../blocs/evens/product_event/search_product_event.dart';
import '../../../blocs/states/product_state/search_all_state.dart';
//widgets
import '../../widgets/product_item.dart';
import '../../widgets/button/button_gradient.dart';
import '../../widgets/page_view/page_empty.dart';

import '../../../features/fetch_profile/fetch_profile_event.dart';
import '../../../features/fetch_profile/fetch_profile_state.dart';
import '../../../domain/entities/profile.dart';
import '../../../ui/widgets/page_view/page_error.dart';
import '../../../features/edit_address/edit_address_bloc.dart';
import '../../../features/edit_address/edit_address_event.dart';
import '../../../features/edit_address/edit_address_state.dart';
//helper
import '../../../core/helper.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({super.key});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FetchProfileBloc>().add(GetProfile());
      context.read<EditAddressBloc>().add(GetAddressEvent());
      context.read<SearchProductAllBloc>().add(GetAllProductsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FetchProfileBloc, FetchProfileState>(
          listenWhen: (p, c) => p.deleteAccountState != c.deleteAccountState,
          listener: (context, state) {
            state.deleteAccountState.maybeWhen(
              success: (_) {
                context.read<AuthBloc>().add(LogoutRequested());
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is! Authenticated) {
              context.go(RoutePaths.login);
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: MyColor.pinkColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Tài Khoản Của Bạn',
              style: TextStyle(color: MyColor.textColor, fontSize: 20),
            ),
          ),

          iconTheme: const IconThemeData(color: MyColor.textColor),
          actions: [
            PopupMenuButton<String>(
              icon: const Icon(Icons.settings),
              onSelected: (value) {
                if (value == 'delete') {
                  _confirmDeleteAccount(context);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Xoá tài khoản',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: BlocSelector<FetchProfileBloc, FetchProfileState, Profile?>(
          selector: (state) => state.profile,
          builder: (context, profile) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 1) Container: avatar + name
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 36,
                          backgroundColor: Colors.blueAccent,
                          backgroundImage: const AssetImage(
                            'assets/icons/5.png',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile?.userName ?? 'Tên người dùng',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Khách hàng',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 6),
                            Text(
                              'Tên KH: ${profile?.fullName}',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Email: ${profile?.email}',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'SĐT: ${profile?.phone ?? 'Chưa có'}',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Thứ hạng:  ${mapMembershipLevel(profile?.membershipLevel)}',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(height: 12),

                            ButtonGradient(
                              text: 'Đăng xuất',
                              onPressed: () {
                                context.read<AuthBloc>().add(LogoutRequested());
                              },
                              width: 120,
                              height: 40,
                              borderRadius: 20,
                              gradient: MyColor.mainGradient2,
                            ),
                          ],
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              context.push(RoutePaths.updateProfile);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  BlocBuilder<EditAddressBloc, EditAddressState>(
                    builder: (context, state) {
                      return Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 12,
                          bottom: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(right: 44),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 6),
                                  Text(
                                    'Địa chỉ: ${state.addressDefault?.fullAddress}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    'SĐT: ${state.addressDefault?.phone ?? 'Chưa có'}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  context.push(RoutePaths.editAddress);
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 12),

                  // 3) Container: hàng 3 ô vuông
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: MyColor.colorappbar,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    // đảm bảo cao vừa đủ cho 3 ô ngang
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // mỗi ô chiếm đều chiều ngang, có padding giữa
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: ButtonGradient(
                              text: 'Điểm\ncủa tôi',
                              onPressed: () {
                                context.push(RoutePaths.getPointDaily);
                              },
                              // cho rộng tối đa trong Expanded, chiều cao phù hợp
                              width: double.infinity,
                              height: 84,
                              borderRadius: 12,
                              gradient: MyColor.mainGradient,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 3.0,
                            ),
                            child: ButtonGradient(
                              text: 'Chi tiêu',
                              onPressed: () {
                                context.push(RoutePaths.spending);
                              },
                              width: double.infinity,
                              height: 84,
                              borderRadius: 12,
                              gradient: MyColor.mainGradient,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: ButtonGradient(
                              text: 'Lịch sử\nmua sắm',
                              onPressed: () {
                                context.push(RoutePaths.getPointDaily);
                              },
                              width: double.infinity,
                              height: 84,
                              borderRadius: 12,
                              gradient: MyColor.mainGradient,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),
                  ButtonGradient(
                    text: 'kho voucher',
                    onPressed: () {
                      context.push(RoutePaths.voucher);
                    },
                    width: 140,
                    height: 40,
                    borderRadius: 10,
                    gradient: MyColor.mainGradient3,
                  ),
                  const SizedBox(height: 14),

                  // 4) Container: tiêu đề sản phẩm + nút xem
                  Divider(
                    color: Colors.white.withOpacity(0.9), // màu trắng nhẹ
                    thickness: 1.5, // độ dày mảnh
                    height: 8, // khoảng cách theo chiều dọc
                  ),
                  Center(
                    child: const SizedBox(
                      height: 20,
                      child: Text(
                        'sản phẩm yêu thích',
                        style: TextStyle(
                          color: Color.fromARGB(255, 77, 74, 74),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white.withOpacity(0.9), // màu trắng nhẹ
                    thickness: 1.5, // độ dày mảnh
                    height: 8, // khoảng cách theo chiều dọc
                  ),
                  const SizedBox(height: 14),
                  //dánh sách product
                  BlocBuilder<SearchProductAllBloc, SearchProductAllState>(
                    builder: (context, state) {
                      if (state is SearchProductAllLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is SearchProductAllSuccess) {
                        final listProduct = state.products;
                        if (listProduct.isEmpty) {
                          return const Center(
                            child: EmptyView(
                              message: 'Không có dữ liệu sản phẩm',
                            ),
                          );
                        }

                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          // padding: const EdgeInsets.symmetric(horizontal: 10),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 9,
                                mainAxisSpacing: 9,
                                childAspectRatio: 0.62,
                              ),
                          itemCount: listProduct.length,
                          itemBuilder: (context, index) {
                            final product = listProduct[index];
                            return ProductItem(
                              onTap: () {
                                context.push(
                                  RoutePaths.productDetail,
                                  extra: product.productId,
                                );
                              },
                              imagePath: product.imagePath ?? '',
                              name: product.productName,
                              price: product.basePrice,
                              soldCount: product.soldQuantity,
                            );
                          },
                        );
                      }

                      if (state is SearchProductAllFailure) {
                        return Center(child: Text("Lỗi: ${state.error}"));
                      }

                      return const SizedBox.shrink();
                    },
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void _confirmDeleteAccount(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text('Xác nhận'),
      content: const Text('Bạn có chắc chắn muốn xoá tài khoản?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Huỷ'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<FetchProfileBloc>().add(DeleteAccount());
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text('Xoá'),
        ),
      ],
    ),
  );
}
