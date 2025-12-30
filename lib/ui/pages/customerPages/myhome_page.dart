import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';
import 'package:nailxinh/ui/pages/customerPages/shop_detail.dart';
import 'package:nailxinh/ui/pages/customerPages/shopping_page.dart';
import 'package:nailxinh/ui/pages/customerPages/user_detail.dart';
import 'booking_page.dart';
import 'order_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/bloc/auth_bloc.dart';
import '../../../blocs/states/auth_state.dart';
//bloc
import '../../../blocs/bloc/product_bloc/search_all.dart';
import '../../../core/dependency_injection/service_locator.dart';
//usecase
import '../../../domain/usecases/product_usecase/search_product_usecase.dart';
//go router
import 'package:go_router/go_router.dart';
import '../../../routers/router_path.dart';
import '../../../routers/router_name.dart';
import '../../../routers/router.dart';
import '../../pages/customerPages/appointment_page.dart';
//voucherbloc
import '../../../features/fetch_Voucher/fetch_voucher_bloc.dart';
import '../../../features/fetch_Voucher/fetch_voucher_event.dart';
import '../../../features/fetch_Voucher/fetch_voucher_state.dart';
import '../../../domain/usecases/voucher_usecase.dart';
import '../../../features/edit_address/edit_address_bloc.dart';
import '../../../domain/usecases/address_usecase.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Trang

  final List<Widget> _pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider<SearchProductAllBloc>(
          create: (_) => SearchProductAllBloc(sl<SearchProductUseCase>()),
        ),
        BlocProvider<VoucherBloc>(
          create: (_) => VoucherBloc(voucherUseCase: sl<VoucherUseCase>()),
        ),
      ],
      child: Shopping(),
    ),
    Booking(),
    OrderHistory(),
    MultiBlocProvider(
      providers: [
        BlocProvider<SearchProductAllBloc>(
          create: (_) => SearchProductAllBloc(sl<SearchProductUseCase>()),
        ),
        BlocProvider<VoucherBloc>(
          create: (_) => VoucherBloc(voucherUseCase: sl<VoucherUseCase>()),
        ),
      ],
      child: ShopDetail(),
    ),

    MultiBlocProvider(
      providers: [
        BlocProvider<SearchProductAllBloc>(
          create: (_) => SearchProductAllBloc(sl<SearchProductUseCase>()),
        ),
        BlocProvider<EditAddressBloc>(
          create: (_) => EditAddressBloc(addressUseCase: sl<AddressUseCase>()),
        ),
      ],
      child: UserDetail(),
    ),
  ];

  void _onItemTapped(int index) {
    if (index == 4 || index == 2) {
      final authState = context.read<AuthBloc>().state;
      if (authState is Unauthenticated) {
        context.push(RoutePaths.login);
        return;
      }
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        child: ClipRRect(
          child: Container(
            decoration: BoxDecoration(gradient: MyColor.mainGradient),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xFF3C031F),
              unselectedItemColor: Colors.white70,
              selectedLabelStyle: TextStyle(fontSize: 10), // cỡ chữ khi chọn
              unselectedLabelStyle: TextStyle(fontSize: 10),

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
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, size: 24),
      ),
      label: label,
    );
  }
}
