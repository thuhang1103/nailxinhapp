import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/product_detail.dart';
//mycolor
import '../../../core/color/mycolor.dart';

//router
import '../../../routers/router.dart';
import '../../../routers/router_path.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/fetch_detail_product/bloc.dart';
import '../../../features/fetch_detail_product/state.dart';
import '../../../features/fetch_detail_product/event.dart';
import '../../widgets/button/button_gradient.dart';
import 'package:intl/intl.dart';
//gallery
import '../../widgets/produc_gallery.dart';

class ProductDetailPage extends StatefulWidget {
  final int productID;

  const ProductDetailPage({Key? key, required this.productID})
    : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _appBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailBloc>().add(
        FetchProductDetail(productId: widget.productID),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final galleryHeight = screenWidth + 51;
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          final pixels = scroll.metrics.pixels;
          final maxOffset = (galleryHeight - kToolbarHeight).clamp(
            1.0,
            double.infinity,
          );
          final op = (pixels / maxOffset).clamp(0.0, 1.0);
          if ((op - _appBarOpacity).abs() > 0.01) {
            setState(() => _appBarOpacity = op);
          }
          return false;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              // dynamic translucent background as user scrolls
              backgroundColor: Colors.white.withOpacity(
                0.15 + 0.7 * _appBarOpacity,
              ),
              expandedHeight: galleryHeight, // chiều cao ProductGallery
              pinned: true, // appBar vẫn hiện khi scroll
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Material(
                  color: Colors.white.withOpacity(0.8), // nền trắng trong suốt
                  shape: const CircleBorder(),
                  elevation: 0,
                  child: IconButton(
                    padding: const EdgeInsets.all(1),
                    constraints: const BoxConstraints(),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: MyColor.textColor,
                    ),
                    onPressed: () => context.pop(),
                    iconSize: 19,
                  ),
                ),
              ),
              actions: [
                Material(
                  color: Colors.white.withOpacity(0.8), // nền trắng trong suốt
                  shape: const CircleBorder(),
                  elevation: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: MyColor.textColor,
                    ),
                    onPressed: () => context.push(RoutePaths.cart),
                    iconSize: 19,
                  ),
                ),
              ],
              flexibleSpace: BlocBuilder<ProductDetailBloc, FetchProductState>(
                builder: (context, state) {
                  final product = state.product;
                  if (product == null) {
                    // placeholder (hoặc spinner) khi chưa có product
                    return const FlexibleSpaceBar(
                      background: SizedBox.shrink(),
                    );
                  }
                  return FlexibleSpaceBar(
                    background: ProductGallery(product: product),
                  );
                },
              ),
            ),

            SliverToBoxAdapter(
              child: BlocBuilder<ProductDetailBloc, FetchProductState>(
                builder: (context, state) {
                  final product = state.product;
                  if (product == null) {
                    return const SizedBox.shrink(
                      child: Text("Không có sản phẩm"),
                    );
                  }
                  return _productContent(product);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: ButtonGradient(
                  onPressed: () {
                    // gọi tới bloc/repository để thêm vào giỏ hàng
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đã thêm vào giỏ')),
                    );
                  },
                  text: 'Thêm vào giỏ',
                  height: 48,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ButtonGradient(
                  onPressed: () {
                    // gọi tới bloc/repository để thêm vào giỏ hàng
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('chuyển trang thanh toán ')),
                    );
                  },
                  text: 'Mua Ngay',
                  height: 48,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _productContent(ProductDetail product) {
  final bp = product.basePrice;
  final hasNoFraction = bp != null && (bp - bp.truncateToDouble()).abs() < 1e-9;
  final nf = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: '₫',
    decimalDigits: hasNoFraction ? 0 : 2,
  );
  final priceText = bp != null ? nf.format(bp) : '0 ₫';
  return SingleChildScrollView(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                height: 1, //
                thickness: 0.5,
                color: Color.fromARGB(255, 215, 214, 214),
              ),
              Text(
                priceText,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 4),
              const Divider(
                height: 1, //
                thickness: 1,
                color: Color.fromARGB(255, 215, 214, 214),
              ),
              const SizedBox(height: 4),
              Text(
                product.productName ?? 'Tên sản phẩm',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              const Divider(
                height: 1, //
                thickness: 1,
                color: Color.fromARGB(255, 215, 214, 214),
              ),
              const SizedBox(height: 4),

              Row(
                children: [
                  Text(
                    'Đã bán: ${product.soldQuantity}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(width: 16),
                  if (product.categoryId != null)
                    Text(
                      'Danh mục: ${product.categoryId}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                ],
              ),
              const SizedBox(height: 6),
              const Divider(
                height: 1, //
                thickness: 1,
                color: Color.fromARGB(255, 215, 214, 214),
              ),
              const SizedBox(height: 6),

              const Text(
                'Mô tả',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                product.description ?? 'Không có mô tả.',
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    ),
  );
}

//   Widget _placeholderImage() {
//     return Container(
//       color: Colors.grey[200],
//       child: const Center(
//         child: Icon(Icons.image_outlined, size: 64, color: Colors.grey),
//       ),
//     );
//   }
// }
