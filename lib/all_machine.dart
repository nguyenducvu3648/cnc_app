import 'package:flutter/material.dart';
import 'package:untitled5/table_calendar.dart';

class all_machine extends StatefulWidget {

  @override
  _all_machineState createState() => _all_machineState();
}

class _all_machineState  extends State<all_machine> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            constraints: BoxConstraints.expand(),
            color: Color(0xFFFFFFFF),
            child: ListView(
              children: [
                renderBack(context),
                renderSearch(context),
                renderMachine(context),
                // _buildMachine(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget renderBack(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(bottom: 19, left: 10, right: 10),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context); // Hàm này sẽ quay lại trang trước
              },
              child: Container(
                margin: EdgeInsets.only(top: 2, right: 21),
                width: 46,
                height: 34,
                child: Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget renderSearch(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFF2F3F2),
      ),
      padding: EdgeInsets.only(left: 12, right: 12),
      margin: EdgeInsets.all(16),
      height: 50,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 8),
            width: 20,
            height: 20,
            child: Image.network(
              'https://raw.githubusercontent.com/coredxor/images/main/v6.png',
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(12),
              width: double.infinity,
              height: double.infinity,
              child: TextField(
                style: TextStyle(
                  color: Color(0xFF7C7C7C),
                  fontSize: 14,
                ),
                controller: TextEditingController(
                  text: 'Search Everything...',
                ),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget renderMachine(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Padding cho GridView
      child: GridView.count(
        crossAxisCount: 2, // Số lượng cột
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(), // Sử dụng physics này để đảm bảo cuộn được
        children: [
          _buildMachine(context, 'Machine1', Color(0xFFC5E5A5)),
          _buildMachine(context, 'Machine2', Color(0xFF9DFBD1)),
          _buildMachine(context, 'Machine3', Color(0xFFB1FB9D)),
          _buildMachine(context, 'Machine4', Color(0xFFEA9DFB)),
          _buildMachine(context, 'Machine5', Color(0xFF9DB8FB)),


          // Thêm các máy mới vào đây
        ],
      ),
    );
  }


  Widget _buildMachine(BuildContext context, String machineName, Color backgroundColor) {
    double containerWidth = MediaQuery.of(context).size.width * 0.4;
    double containerHeight = 180.0; // Đã thay đổi chiều cao

    return GestureDetector(
      onTap: () {
        // Thực hiện hành động khi nhấn vào máy ở đây, ví dụ chuyển sang một trang khác
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TableCalendar()),
        );
      },
      child: Container(
        margin: EdgeInsets.all(40), // Đã giảm margin
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              machineName,
              style: TextStyle(
                color: Color(0xFF252624),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'running',
              style: TextStyle(
                color: Color(0xFF252624),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }


}


