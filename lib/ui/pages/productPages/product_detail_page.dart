import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../domain/entities/product_detail.dart';
//mycolor
import '../../../core/color/mycolor.dart';
//commomstate
import '../../../core/common_state.dart';

//router
import '../../../routers/router.dart';
import '../../../routers/router_path.dart';
//bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/fetch_detail_product/bloc.dart';
import '../../../features/fetch_detail_product/state.dart';
import '../../../features/fetch_detail_product/event.dart';
import '../../../features/add_product_inCart/add_product_bloc.dart';
import '../../../features/add_product_inCart/add_product_event.dart';
import '../../../features/add_product_inCart/add_product_state.dart';
import '../../../blocs/bloc/product_bloc/search_product_name_bloc.dart';
import '../../../blocs/evens/product_event/search_product_event.dart';

import '../../../blocs/states/product_state/search_product_name_state.dart';

import '../../widgets/button/button_gradient.dart';
import 'package:intl/intl.dart';
import '../../widgets/product_item.dart';

//gallery
import '../../widgets/produc_gallery.dart';
import '../../widgets/page_view/page_error.dart';
import '../../widgets/page_view/page_loading.dart';
import '../../widgets/page_view/page_empty.dart';

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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: BlocListener<ProductDetailBloc, FetchProductState>(
        listener: (context, state) {
          final isSuccess = state.productState.maybeWhen(
            success: (_) => true,
            orElse: () => false,
          );
          if (isSuccess && state.product != null) {
            context.read<SearchProductNameBloc>().add(
              SearchProductByNameEvent(state.product!.productName ?? 'Nail'),
            );
          }
        },
        child: NotificationListener<ScrollNotification>(
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
                // transition from transparent -> white as user scrolls
                backgroundColor: Color.lerp(
                  Colors.transparent,
                  Colors.white,
                  _appBarOpacity,
                ),
                expandedHeight: galleryHeight, // chiều cao ProductGallery
                pinned: true, // appBar vẫn hiện khi scroll
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Material(
                    // keep circular white background for icons, slightly fade with opacity
                    color: Colors.white.withOpacity(
                      0.85 * _appBarOpacity + 0.15,
                    ),
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
                    color: Colors.white.withOpacity(
                      0.85 * _appBarOpacity + 0.15,
                    ),
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
                flexibleSpace:
                    BlocBuilder<ProductDetailBloc, FetchProductState>(
                      builder: (context, state) {
                        return state.productState.maybeWhen(
                          loading: () => const FlexibleSpaceBar(
                            background: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          success: (data) {
                            final product = state.product;
                            if (product == null) {
                              return const FlexibleSpaceBar(
                                background: SizedBox.shrink(),
                              );
                            }
                            return FlexibleSpaceBar(
                              background: ProductGallery(product: product),
                            );
                          },
                          error: (_) => const FlexibleSpaceBar(
                            background: Center(child: Text('Lỗi tải ảnh')),
                          ),
                          orElse: () => const FlexibleSpaceBar(
                            background: SizedBox.shrink(),
                          ),
                        );
                      },
                    ),
              ),

              SliverToBoxAdapter(
                child: BlocBuilder<ProductDetailBloc, FetchProductState>(
                  builder: (context, state) {
                    return state.productState.maybeWhen(
                      loading: () => LoadingView(),
                      success: (data) {
                        final product = state.product;
                        if (product == null) {
                          return EmptyView(
                            message: "sản phẩm không còn tồn tại ",
                          );
                        }
                        return _productContent(product);
                      },
                      error: (failure) {
                        final msg = failure.toString();
                        return ErrorView(
                          message: msg,
                          onRetry: () {
                            context.read<ProductDetailBloc>().add(
                              FetchProductDetail(productId: widget.productID),
                            );
                          },
                        );
                      },
                      orElse: () =>
                          const FlexibleSpaceBar(background: SizedBox.shrink()),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Container(height: 10, color: const Color(0xFFE0E0E0)),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    'Sản phẩm tương tự',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),

              BlocBuilder<SearchProductNameBloc, SearchProductNameState>(
                builder: (context, state) {
                  if (state is SearchProductNameLoading) {
                    return const SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                  }

                  if (state is SearchProductNameFailure) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text('Lỗi: ${state.error}')),
                    );
                  }

                  if (state is SearchProductNameSuccess) {
                    final listProduct = state.products;
                    if (listProduct.isEmpty) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text('Không tìm thấy sản phẩm tương tự'),
                          ),
                        ),
                      );
                    }

                    return SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 9,
                              mainAxisSpacing: 9,
                              childAspectRatio: 0.62,
                            ),
                        delegate: SliverChildBuilderDelegate((context, index) {
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
                        }, childCount: listProduct.length),
                      ),
                    );
                  }

                  // default fallback
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
            ],
          ),
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
                    showAddToCartBottomSheet(
                      context: context,
                      productId: widget.productID,
                    );
                  },
                  text: 'Thêm vào giỏ',
                  height: 48,
                  gradient: MyColor.mainGradient2,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ButtonGradient(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('chuyển trang thanh toán ')),
                    );
                  },
                  text: 'Mua Ngay',
                  height: 48,
                  gradient: MyColor.mainGradient2,
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

Future<void> showAddToCartBottomSheet({
  required BuildContext context,
  required int productId,
}) async {
  final bloc = context.read<AddProductToCartBloc>();
  bloc.add(ResetState());
  bloc.add(LoadFullOptions(productId));

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (sheetContext) {
      return BlocProvider.value(
        value: bloc,
        child: BlocConsumer<AddProductToCartBloc, AddProductToCartState>(
          listener: (context, state) {
            state.addToCartState.maybeWhen(
              success: (data) {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã thêm sản phẩm vào giỏ')),
                );
              },
              error: (failure) {
                Navigator.of(context).pop();
                final msg = failure?.toString() ?? 'Lỗi';
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(msg)));
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            if (state.addToCartState is Loading) {
              return const SizedBox(
                height: 200,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final fullOptions = state.fullOptions;
            final selectedValues = state.selectedValues;
            final quantity = state.quantity;

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                top: 16,
                left: 16,
                right: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Chọn thuộc tính:',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Hiển thị option
                  for (var option in fullOptions)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(option.optionName),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          children: option.values.map((value) {
                            final isSelected =
                                selectedValues[option.optionID] ==
                                value.valueID;
                            return ChoiceChip(
                              label: Text(value.valueName ?? 'mặc định'),
                              selected: isSelected,
                              onSelected: (_) {
                                bloc.add(
                                  SelectValue(
                                    option.optionID,
                                    value.valueID ?? 0,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),

                  // Số lượng
                  Row(
                    children: [
                      const Text('Số lượng:'),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 1)
                            bloc.add(ChangeQuantity(quantity - 1));
                        },
                      ),
                      Text('$quantity'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          bloc.add(ChangeQuantity(quantity + 1));
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Thêm vào giỏ
                  SizedBox(
                    width: double.infinity,
                    child: ButtonGradient(
                      onPressed: () {
                        bloc.add(AddToCart(productId));
                      },
                      text: 'Thêm vào giỏ',
                      height: 40,
                      gradient: MyColor.mainGradient2,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}
