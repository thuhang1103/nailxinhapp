import 'package:flutter/material.dart';

class ProductGalleryWidget extends StatefulWidget {
  final Map<String, dynamic> product;
  const ProductGalleryWidget({required this.product, super.key});

  @override
  State<ProductGalleryWidget> createState() => _ProductGalleryWidgetState();
}

class _ProductGalleryWidgetState extends State<ProductGalleryWidget> {
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
    final images = List<String>.from(widget.product['Images'] ?? []);

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
          aspectRatio: 16 / 12,
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
              return Hero(
                tag: 'product_${widget.product['ProductID']}_$index',
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 8),

        // Hàng ảnh nhỏ (thumbnails)
        SizedBox(
          height: 60,
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
                  padding: isSelected
                      ? const EdgeInsets.all(2)
                      : EdgeInsets.zero,
                  decoration: BoxDecoration(
                    border: isSelected
                        ? Border.all(color: Colors.blue, width: 2)
                        : null,
                  ),
                  child: Image.network(
                    imageUrl,
                    width: 60,
                    height: 60,
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
