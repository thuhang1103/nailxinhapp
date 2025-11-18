import 'package:flutter/material.dart';

class FullscreenImageView extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  final String tagPrefix;

  const FullscreenImageView({
    required this.images,
    required this.initialIndex,
    required this.tagPrefix,
    super.key,
  });

  @override
  State<FullscreenImageView> createState() => _FullscreenImageViewState();
}

class _FullscreenImageViewState extends State<FullscreenImageView> {
  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _controller = PageController(initialPage: widget.initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.images.length,
        onPageChanged: (index) => setState(() => _currentIndex = index),
        itemBuilder: (_, index) {
          return Center(
            child: Hero(
              tag: '${widget.tagPrefix}_$index',
              child: InteractiveViewer(
                child: Image.network(widget.images[index], fit: BoxFit.contain),
              ),
            ),
          );
        },
      ),
    );
  }
}
