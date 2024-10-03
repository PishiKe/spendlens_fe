import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final double? width, height;
  final Function onTap;

  const CustomIconButton(
      {super.key,
      required this.icon,
      this.height = 40,
      this.width = 50,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap as void Function(),
        child: SvgPicture.asset(
          icon,
          width: width,
          height: height,
        ));
  }
}
