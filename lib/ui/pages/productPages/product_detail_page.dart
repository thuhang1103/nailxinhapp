import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/products.dart';
//mycolor
import '../../../core/color/mycolor.dart';
//widget
import '../../widgets/searchBox/searchButton.dart';
//router
import '../../../routers/router.dart';
import '../../../routers/router_name.dart';
import '../../../routers/router_path.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/fetch_detail_product/bloc.dart';
import '../../../features/fetch_detail_product/state.dart';
import '../../../features/fetch_detail_product/event.dart';
import '../../../core/common_state.dart';
import '../../widgets/button/button_gradient.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailBloc>().add(
        FetchProductDetail(productId: widget.product.productId),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // final priceText =
    //     '${widget.product.price.toStringAsFixed(widget.product.price.truncateToDouble() == widget.product.price ? 0 : 2)} đ';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: MyColor.textColor,
                ),
                onPressed: () => context.pop(),
                iconSize: 19,
              ),
            ),
            Expanded(
              child: SearchButton(
                onTap: () {
                  context.go(RoutePaths.search); //cần chỉnh
                },
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: MyColor.textColor,
              ),
              onPressed: () => context.pushNamed(RouteNames.cartPage),
              iconSize: 19,
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(
                Icons.settings_outlined,
                color: MyColor.textColor,
              ),
              onPressed: () {},
              iconSize: 19,
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProductDetailBloc, FetchProductState>(
        builder: (context, state) {
          final cs = state.state;
          return cs.maybeWhen<Widget>(
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) {
              final product = state.product ?? widget.product;
              return _productContent(product);
            },
            error: (failure) {
              final message = failure.toString();
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Lỗi: $message'),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProductDetailBloc>().add(
                          FetchProductDetail(
                            productId: widget.product.productId,
                          ),
                        );
                      },
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              );
            },
            orElse: () => _productContent(state.product ?? widget.product),
          );
        },
      ),

      // sticky action bar at bottom
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
                    // xử lý mua ngay
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Chuyển tới thanh toán')),
                    );
                  },
                  text: 'Mua ngay',
                  height: 48,
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productContent(Product product) {
    final priceText =
        '${product.price.toStringAsFixed(product.price.truncateToDouble() == product.price ? 0 : 2)} đ';

    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 12,
            child: Hero(
              tag: 'product_${product.productId}',
              child: product.imagePath != null && product.imagePath!.isNotEmpty
                  ? Image.network(
                      product.imagePath!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (_, __, ___) => _placeholderImage(),
                    )
                  : _placeholderImage(),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  priceText,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.productName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),

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
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
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

  Widget _placeholderImage() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Icon(Icons.image_outlined, size: 64, color: Colors.grey),
      ),
    );
  }
}
