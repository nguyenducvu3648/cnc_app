import 'package:flutter/material.dart';

class machine_infor extends StatefulWidget {

  @override
  _machine_inforState createState() => _machine_inforState();
}
class _machine_inforState extends State<machine_infor>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Color(0xFFFFFFFF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFFFFFFFF),
                  padding: EdgeInsets.only( top: 25, bottom: 79, left: 18, right: 18),
                  width: double.infinity,
                  height: double.infinity,
                  child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IntrinsicHeight(
                            child: Container(
                              margin: EdgeInsets.only( bottom: 54),
                              width: double.infinity,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only( top: 2, right: 21),
                                        width: 36,
                                        height: 24,
                                        child: Image.network(
                                          'https://i.imgur.com/1tMFzp8.png',
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                    Expanded(
                                      child: IntrinsicHeight(
                                        child: Container(
                                          width: double.infinity,
                                          child: Text(
                                            'Explore',
                                            style: TextStyle(
                                              color: Color(0xFFFFFFFD),
                                              fontSize: 38,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Color(0xFF51EA8E),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 68),
                              margin: EdgeInsets.only( bottom: 29),
                              width: double.infinity,
                              child: Column(
                                  children: [
                                    Text(
                                      'Totail Products',
                                      style: TextStyle(
                                        color: Color(0xFF252625),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Color(0xFF8A94F2),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 65),
                              margin: EdgeInsets.only( bottom: 29),
                              width: double.infinity,
                              child: Column(
                                  children: [
                                    Text(
                                      'Standard product',
                                      style: TextStyle(
                                        color: Color(0xFF252625),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Color(0xFF8C3BA0),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 66),
                              margin: EdgeInsets.only( bottom: 89),
                              width: double.infinity,
                              child: Column(
                                  children: [
                                    Text(
                                      'Damaged Products',
                                      style: TextStyle(
                                        color: Color(0xFF252625),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          IntrinsicHeight(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Color(0xFF8AF2D2),
                              ),
                              padding: EdgeInsets.only( top: 19, bottom: 19, left: 105, right: 40),
                              width: double.infinity,
                              child: Row(
                                  children: [
                                    IntrinsicHeight(
                                      child: Container(
                                        margin: EdgeInsets.only( right: 30),
                                        child: Text(
                                          'See Detail',
                                          style: TextStyle(
                                            color: Color(0xFF2A582A),
                                            fontSize: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        width: 36,
                                        height: 24,
                                        child: Image.network(
                                          'https://i.imgur.com/1tMFzp8.png',
                                          fit: BoxFit.fill,
                                        )
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}











