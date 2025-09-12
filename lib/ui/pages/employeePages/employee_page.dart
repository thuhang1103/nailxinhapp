import 'package:flutter/material.dart';

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Trang 1 - Thông tin nhân viên')),
    Center(child: Text('Trang 2 - Lịch làm việc')),
    Center(child: Text('Trang 3 - Thông báo')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showEmployeeInfo() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Thông tin nhân viên'),
          content: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Họ và tên: Nguyễn Văn A'),
                SizedBox(height: 8),
                Text('Chức vụ: Nhân viên phát triển phần mềm'),
                SizedBox(height: 8),
                Text('Email: nguyenvana@example.com'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Nhân Viên'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: _showEmployeeInfo,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/image1.PNG', // Thay bằng URL ảnh thực tế hoặc Image.asset() nếu là ảnh local
                ),
              ),
            ),
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.calendar_today),
              color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
              onPressed: () => _onItemTapped(1),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              onPressed: () => _onItemTapped(2),
            ),
          ],
        ),
      ),
    );
  }
}