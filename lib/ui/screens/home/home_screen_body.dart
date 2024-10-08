import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splendlens_fe/ui/screens/home/home.dart';
import 'package:splendlens_fe/utilities/utilities.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Stack(
        children: <Widget>[
          Container(
            width: DeviceConfig.screenWidth,
            height: DeviceConfig.screenHeight,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(color: Colors.blue.shade900),
            child: Container(
              child: ListTile(
                leading: SvgPicture.asset(AppConstants().walletIcon),
                title: Text(
                  'Total Amount',
                  style: AppTheme().whiteNormallineStyle,
                ),
                subtitle: Text(
                  '1233',
                  style: AppTheme().whiteBoldHeadlineStyle,
                ),
                trailing: SizedBox(
                  height: 40.0,
                  child: MaterialButton(
                    elevation: 0,
                    color: Colors.blue.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0)),
                    onPressed: () {},
                    child: Text(
                      'View Detail',
                      style: AppTheme().whiteNormallineStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: getProportionateScreenHeight(0),
            child: Container(
                width: DeviceConfig.screenWidth,
                height: getProportionateScreenHeight(500),
                color: Colors.white),
          ),
          Positioned(
            top: getProportionateScreenHeight(90),
            width: DeviceConfig.screenWidth,
            child: Container(
                padding: EdgeInsets.only(top: 30),
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(24),
                ),
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: HomeBarChart()),
          ),
          Positioned(
              bottom: 0,
              height: getProportionateScreenHeight(350),
              width: DeviceConfig.screenWidth,
              child: Column(
                children: [
                  const TabBar(
                    tabs: [
                      Tab(
                        text: 'January',
                      ),
                      Tab(
                        text: 'February',
                      ),
                      Tab(
                        text: 'March',
                      )
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Container(
                        color: Colors.grey.shade100,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(12),
                            right: getProportionateScreenWidth(12),
                            top: getProportionateScreenWidth(24),
                          ),
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) => const Card(
                              color: Colors.white,
                              elevation: 0,
                              child: ListTile(
                                leading: Icon(Icons.sell_rounded),
                                title: Text('Food & Bevereges'),
                                subtitle: Text('Sarova mombasa'),
                                trailing: Text('KES 7,500'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text('Feb'),
                      ),
                      Center(
                        child: Text('Mar'),
                      ),
                    ]),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
