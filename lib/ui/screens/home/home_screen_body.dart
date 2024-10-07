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
    return Stack(
      children: <Widget>[
        Container(
          width: DeviceConfig.screenWidth,
          height: DeviceConfig.screenHeight,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(color: Colors.blue.shade900),
          child: Container(
            // color: Colors.white24,
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
              color: Colors.grey.shade300),
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
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: HomeBarChart()),
        ),
      ],
    );
  }
}
