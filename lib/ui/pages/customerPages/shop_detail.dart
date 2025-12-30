import 'package:flutter/material.dart';
import '../../../ui/widgets/button/button_gradient.dart';
import '../../../core/color/mycolor.dart';

//router
import 'package:go_router/go_router.dart';
import '../../../routers/router_path.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/product_bloc/search_all.dart';
import '../../../blocs/evens/product_event/search_product_event.dart';
import '../../../blocs/states/product_state/search_all_state.dart';
//ưidget
import '../../widgets/product_item.dart';
import '../../widgets/page_view/page_empty.dart';

class ShopDetail extends StatefulWidget {
  const ShopDetail({Key? key}) : super(key: key);

  @override
  State<ShopDetail> createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  // trạng thái để mở rộng review theo index
  final Set<int> _expandedReviews = {};
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<VoucherBloc>().add(FetchVoucherEvent());
      context.read<SearchProductAllBloc>().add(GetAllProductsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColor.pinkColor,
        elevation: 0,
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(left: 10.0),
          child: Text(
            'NailXinh',
            style: TextStyle(color: MyColor.textColor, fontSize: 20),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble, color: MyColor.textColor),
            onPressed: () {
              context.push(RoutePaths.chatPage);
            },
            iconSize: 24,
          ),
        ],
      ),

      // body mới theo yêu cầu
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                // Chi nhánh 1
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Chi nhánh 1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Địa chỉ: 12 Lê Lợi, Phường 1, Quận 1, TP. HCM',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'SĐT: 0901234567',
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              // gọi điện hoặc copy số
                            },
                            icon: const Icon(Icons.phone_outlined, size: 16),
                            label: const Text(
                              'Gọi',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Chi nhánh 2
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Chi nhánh 2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Địa chỉ: 45 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP. HCM',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'SĐT: 0912345678',
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              // gọi điện hoặc copy số
                            },
                            icon: const Icon(Icons.phone_outlined, size: 16),
                            label: const Text(
                              'Gọi',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Chi nhánh 3
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Chi nhánh 3',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Địa chỉ: 78 Trần Hưng Đạo, Phường Phú Hội, TP. Huế',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'SĐT: 0987654321',
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              // gọi điện hoặc copy số
                            },
                            icon: const Icon(Icons.phone_outlined, size: 16),
                            label: const Text(
                              'Gọi',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'thông báo ưu đãi',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 250, 176),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Ưu đãi hôm nay: Giảm 20% cho dịch vụ tay & chân. Liên hệ để biết chi tiết.',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ButtonGradient(
                    onPressed: () {},
                    text: 'Đặt lịch',
                    gradient: MyColor.mainGradient2,
                    borderRadius: 8,
                    height: 36,
                    width: 96,
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Đánh giá cửa hàng',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            Column(
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      if (_expandedReviews.contains(0)) {
                        _expandedReviews.remove(0);
                      } else {
                        _expandedReviews.add(0);
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[300],
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'thu. hà',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.orange[400],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      '4.9',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Dịch vụ rất tốt, nhân viên tận tình. Móng bền, màu đẹp. Sẽ quay lại lần sau.',
                                style: const TextStyle(fontSize: 14),
                                maxLines: _expandedReviews.contains(0)
                                    ? 100
                                    : 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Review 2 (cố định)
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      if (_expandedReviews.contains(1)) {
                        _expandedReviews.remove(1);
                      } else {
                        _expandedReviews.add(1);
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[300],
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    'thanh thanh',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.orange[400],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      '4.7',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Chất lượng ổn, lịch hẹn đúng giờ. Giá cả hợp lý so với chất lượng.',
                                style: const TextStyle(fontSize: 14),
                                maxLines: _expandedReviews.contains(1)
                                    ? 100
                                    : 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                  style: TextStyle(color: Color.fromARGB(255, 77, 74, 74)),
                ),
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.9), // màu trắng nhẹ
              thickness: 1.5, // độ dày mảnh
              height: 8, // khoảng cách theo chiều dọc
            ),
            const SizedBox(height: 12),
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
                      child: EmptyView(message: 'Không có dữ liệu sản phẩm'),
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
      ),
    );
  }
}
