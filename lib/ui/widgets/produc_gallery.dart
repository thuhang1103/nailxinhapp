import 'package:flutter/material.dart';
import '../pages/productPages/fullscreen_image.dart';
import '../../domain/entities/product_detail.dart';

class ProductGallery extends StatefulWidget {
  final ProductDetail product;
  const ProductGallery({required this.product, super.key});

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = List<String>.from(widget.product.images);

    if (images.isEmpty) {
      return Container(
        height: 200,
        color: Colors.grey[300],
        child: const Icon(Icons.image, size: 50),
      );
    }

    return Column(
      children: [
        // Ảnh lớn swipe ngang
        AspectRatio(
          aspectRatio: 1,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (_, index) {
              final imageUrl = images[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FullscreenImageView(
                        images: images,
                        initialIndex: index,
                        tagPrefix: 'product_${widget.product.productId}',
                      ),
                    ),
                  );
                },
                child: Hero(
                  tag: 'product_${widget.product.productId}_$index',
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 50),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        // Hàng ảnh nhỏ (thumbnails)
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (_, index) {
              final imageUrl = images[index];
              final isSelected = _currentIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border.all(
                            color: const Color.fromARGB(255, 249, 10, 10),
                            width: 1,
                          )
                        : null,
                  ),
                  child: Image.network(
                    imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, size: 30),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
