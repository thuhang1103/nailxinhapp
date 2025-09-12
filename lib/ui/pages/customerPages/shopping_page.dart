import 'package:flutter/material.dart';
import 'package:nailxinh/ui/widgets/searchbox.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nailxinh/blocs/evens/user_event.dart';
import 'package:nailxinh/core/color/mycolor.dart';

import '../../widgets/categorybutton.dart';
import '../../widgets/product_item.dart';
import '../../widgets/text_header.dart';
// import '../../blocs/bloc/user_bloc.dart';
// import '../../blocs/states/user_state.dart';
// import '../widgets/categorybutton.dart';
// import '../widgets/product_item.dart';
// import '../widgets/text_header.dart';

class Shopping extends StatefulWidget {
  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {

  final TextEditingController _searchController = TextEditingController();

  void _handleSearch() {
    final query = _searchController.text;
    print("Tìm kiếm: $query");
    // Xử lý logic tìm kiếm ở đây
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: TitleText(text: 'NAILXINH'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Color(0xff630243)),
            onPressed: () {
              // Xử lý khi nhấn icon
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/image1.PNG'), // Đường dẫn ảnh đại diện
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      body: SizedBox.expand(
        child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: MyColor.colorbackground
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image1.PNG'), // ảnh trong assets
                      fit: BoxFit.cover, // fill toàn bộ container
                    )
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 60),

                  // Ô tìm kiếm
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SearchBox(
                      controller: _searchController,
                      onSearch: _handleSearch,
                    ),
                  ),

                  SizedBox(height: 20),

                  // Khung nội dung bên dưới tìm kiếm
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: MyColor.mainGradient,
                        borderRadius: BorderRadius.circular(27),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Nội dung bên dưới khung tìm kiếm',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff0c0209),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryButton(
                        onPressed: () {},
                        child: Image.network('https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/anh2.jpg', width: 30, height: 30),
                      ),
                      CategoryButton(
                        onPressed: () {},
                        child: Image.asset('assets/images/image1.PNG', width: 30, height: 30),
                      ),
                      CategoryButton(
                        onPressed: () {},
                        child: Text('A', style: TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      CategoryButton(
                        onPressed: () {},
                        child: Icon(Icons.star, color: Colors.white),
                      ),
                      CategoryButton(
                        onPressed: () {},
                        child: Image.asset('assets/images/image1.PNG', width: 30, height: 30),
                      ),
                    ],
                  ),

                  // Danh sách sản phẩm
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children: [
                          ProductItem(
                            imagePath: 'assets/images/image1.PNG',
                            name: 'Sơn gel hồng pastel',
                            price: '₫120,000',
                          ),
                          ProductItem(
                            imagePath: 'assets/images/image1.PNG',
                            name: 'Bộ cọ vẽ móng',
                            price: '₫85,000',
                          ),
                          ProductItem(
                            imagePath: 'assets/images/image1.PNG',
                            name: 'Sơn gel hồng pastel',
                            price: '₫120,000',
                          ),
                          ProductItem(
                            imagePath: 'assets/images/image1.PNG',
                            name: 'Bộ cọ vẽ móng',
                            price: '₫85,000',
                          ),
                          ProductItem(
                            imagePath: 'assets/images/image1.PNG',
                            name: 'Sơn gel hồng pastel',
                            price: '₫120,000',
                          ),
                          ProductItem(
                            imagePath: 'assets/images/image1.PNG',
                            name: 'Bộ cọ vẽ móng',
                            price: '₫85,000',
                          ),
                          // ... thêm sản phẩm khác
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ]
        ),
      ),

    );
  }
}