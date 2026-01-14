import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/color/mycolor.dart';
import '../../../../domain/entities/products.dart';
import '../../../../domain/entities/product_detail.dart';
import '../../../../features/fetch_detail_product/bloc.dart';
import '../../../../features/fetch_detail_product/event.dart';
import '../../../../features/fetch_detail_product/state.dart';
import '../../../widgets/page_view/page_loading.dart';
import '../../../widgets/page_view/page_error.dart';
import '../../../widgets/page_view/page_empty.dart';
import '../../../../core/common_state.dart';

class ProductDetailADPage extends StatefulWidget {
  final Product product;

  const ProductDetailADPage({Key? key, required this.product})
    : super(key: key);

  @override
  State<ProductDetailADPage> createState() => _ProductDetailADPageState();
}

class _ProductDetailADPageState extends State<ProductDetailADPage> {
  final ImagePicker _picker = ImagePicker();
  final List<File> _localImages = [];

  late TextEditingController _nameCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _descCtrl;
  late TextEditingController _stockCtrl;

  bool _isActive = true;

  @override
  void initState() {
    super.initState();

    _nameCtrl = TextEditingController(text: widget.product.productName ?? '');
    _priceCtrl = TextEditingController(
      text: (widget.product.basePrice ?? 0).toString(),
    );
    _descCtrl = TextEditingController(text: widget.product.description ?? '');
    _stockCtrl = TextEditingController(
      text: (widget.product.stockQuantity ?? 0).toString(),
    );

    _isActive = (widget.product.statusProduct ?? 1) == 1;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductDetailBloc>().add(
        FetchProductDetail(productId: widget.product.productId),
      );
    });
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _priceCtrl.dispose();
    _descCtrl.dispose();
    _stockCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? picked = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked != null) {
      setState(() => _localImages.add(File(picked.path)));
    }
  }

  void _onUpdate(Product product) {
    if (_nameCtrl.text.trim().isEmpty) {
      _showError('Tên sản phẩm không được trống');
      return;
    }

    final price = int.tryParse(_priceCtrl.text);
    final stock = int.tryParse(_stockCtrl.text);

    if (price == null || price <= 0) {
      _showError('Giá không hợp lệ');
      return;
    }

    if (stock == null || stock < 0) {
      _showError('Số lượng không hợp lệ');
      return;
    }

    final updated = ProductDetail(
      productId: product.productId,
      productName: _nameCtrl.text.trim(),
      basePrice: price.toDouble(),
      description: _descCtrl.text.trim(),
      categoryId: product.categoryId,
      stockQuantity: stock,
      statusProduct: _isActive ? 1 : 0,
    );

    // TODO: dispatch UpdateProductDetail event
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cập nhật sản phẩm (chưa upload ảnh)')),
    );
  }

  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColor.pinkColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: MyColor.textColor,
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Cập nhật sản phẩm',
          style: TextStyle(color: MyColor.textColor),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      body: BlocBuilder<ProductDetailBloc, FetchProductState>(
        builder: (context, state) {
          final productState = state.productState;

          return productState.when(
            initial: () => const LoadingView(),
            loading: () => const LoadingView(),
            error: (message) => ErrorView(message: ''),
            success: (data) {
              // 'data' is the payload from success; cast to your concrete type
              final ProductDetail? productDetail = data as ProductDetail?;

              if (productDetail == null || productDetail.productId == null) {
                return const EmptyView(message: 'Không tìm thấy sản phẩm');
              }

              final remoteImages = productDetail.images;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImages(remoteImages),
                    const SizedBox(height: 16),
                    _buildTextFields(),
                    const SizedBox(height: 16),
                    _buildOptions(),
                    const SizedBox(height: 20),
                    //
                    _buildActions(widget.product),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildImages(List<String> remoteImages) {
    final total = remoteImages.length + _localImages.length + 1;

    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: total,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == total - 1) {
            return GestureDetector(
              onTap: _pickImage,
              child: _imageBox(const Icon(Icons.add_a_photo, size: 28)),
            );
          }

          if (index < remoteImages.length) {
            return _imageBox(
              Image.network(remoteImages[index], fit: BoxFit.cover),
            );
          }

          final file = _localImages[index - remoteImages.length];
          return Stack(
            children: [
              _imageBox(Image.file(file, fit: BoxFit.cover)),
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () => setState(() => _localImages.remove(file)),
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.black54,
                    child: Icon(Icons.close, size: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _imageBox(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 100,
        height: 100,
        color: Colors.grey.shade200,
        child: child,
      ),
    );
  }

  Widget _buildTextFields() {
    return Column(
      children: [
        TextFormField(
          controller: _nameCtrl,
          decoration: const InputDecoration(labelText: 'Tên sản phẩm'),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _priceCtrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Giá (VND)'),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _descCtrl,
          maxLines: 3,
          decoration: const InputDecoration(labelText: 'Mô tả'),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _stockCtrl,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: 'Số lượng'),
        ),
      ],
    );
  }

  Widget _buildOptions() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Trạng thái',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Switch(
            value: _isActive,
            onChanged: (v) => setState(() => _isActive = v),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(Product product) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => _onUpdate(product),
            style: ElevatedButton.styleFrom(backgroundColor: MyColor.pinkColor),
            child: const Text('Cập nhật'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // TODO: Delete product
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Xóa'),
          ),
        ),
      ],
    );
  }
}
