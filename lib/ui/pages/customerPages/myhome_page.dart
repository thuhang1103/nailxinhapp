import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nailxinh/core/color/mycolor.dart';
import 'package:nailxinh/ui/pages/customerPages/shop_detail.dart';
import 'package:nailxinh/ui/pages/customerPages/shopping_page.dart';
import 'package:nailxinh/ui/pages/customerPages/user_detail.dart';

import 'booking_page.dart';
import 'order_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Trang đầu tiên mặc định

  final List<Widget> _pages = [
    Shopping(),
    Booking(),
    OrderHistory(),
    ShopDetail(),
    UserDetail(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar:Container(

        child: ClipRRect(

          child: Container(
            decoration: BoxDecoration(
              gradient: MyColor.mainGradient,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: BottomNavigationBar(
              elevation: 19,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xFF3C031F),
              unselectedItemColor: Colors.white70,
              items: [
                _buildNavItem(Icons.shopping_bag_outlined, 'home'),
                _buildNavItem(Icons.table_view_sharp, 'booking'),
                _buildNavItem(Icons.event_note, 'order'),
                _buildNavItem(Icons.home, 'shop'),
                _buildNavItem(Icons.person, 'user'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 24),
      ),
      label: label,
    );
  }
}