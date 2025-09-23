import 'package:flutter/material.dart';
import 'package:nailxinh/ui/widgets/searchbox.dart';
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
      backgroundColor: MyColor.colorbackround2,
      appBar: AppBar(
        backgroundColor: MyColor.colorappbar,
        titleSpacing: 0, // bỏ padding mặc định
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 0,
            top: 10,
            bottom: 10,
          ),
          child: SearchBox(
            controller: _searchController,
            onSearch: _handleSearch,
          ),
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
                  image: AssetImage(
                    'assets/images/image1.PNG',
                  ), // Đường dẫn ảnh đại diện
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                color: MyColor.colorappbar,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                children: [
                  //vourcher
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: MyColor.mainGradient,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CategoryButton(
                          onPressed: () {},
                          child: Image.network(
                            'https://mnxhotcwxdmhsazwtdac.supabase.co/storage/v1/object/public/products/anh2.jpg',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        CategoryButton(
                          onPressed: () {},
                          child: Image.asset(
                            'assets/images/image1.PNG',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        CategoryButton(
                          onPressed: () {},
                          child: Text(
                            'A',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        CategoryButton(
                          onPressed: () {},
                          child: Icon(Icons.star, color: Colors.white),
                        ),
                        CategoryButton(
                          onPressed: () {},
                          child: Image.asset(
                            'assets/images/image1.PNG',
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Danh sách sản phẩm
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
