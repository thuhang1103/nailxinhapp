import 'package:flutter/material.dart';
import 'package:nailxinh/core/color/mycolor.dart';

import '../../widgets/button/button_gradient.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  final TextEditingController _warehouseController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _totalController = TextEditingController();

  @override
  void dispose() {
    _warehouseController.dispose();
    _dateController.dispose();
    _totalController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.pinkColor,
      appBar: AppBar(
        backgroundColor: MyColor.pinkColor,
        title: const Text(
          'NailXinh',
          style: TextStyle(
            color: MyColor.textColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Container 1: nhập dữ liệu kho
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Nhập kho',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MyColor.textColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _warehouseController,
                      decoration: const InputDecoration(
                        labelText: 'Ghi chú',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _dateController,
                      readOnly: true,
                      onTap: _pickDate,
                      decoration: const InputDecoration(
                        labelText: 'Thời gian',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _totalController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Tổng tiền Nhập Hàng',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ButtonGradient(
                      onPressed: () {
                        // handle xác nhận
                      },
                      text: 'Xác nhận',
                      gradient: MyColor.mainGradient2,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Container 2: lợi nhuận
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Lợi nhuận',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: MyColor.textColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text('Lợi nhuận tháng: 3,000,000 đ'),
                    SizedBox(height: 4),
                    Divider(
                      color: MyColor.textColor,
                      thickness: 1,
                      indent: 16,
                      endIndent: 16,
                    ),
                    Text('Lợi nhuận năm: 36,000,000 đ'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Container 3: 2 nút (bọc Expanded để có constraint)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ButtonGradient(
                        onPressed: () {},
                        text: 'Sp tồn kho',
                        gradient: MyColor.mainGradient2,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ButtonGradient(
                        onPressed: () {},
                        text: 'Sp hết hàng',
                        gradient: MyColor.mainGradient2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
