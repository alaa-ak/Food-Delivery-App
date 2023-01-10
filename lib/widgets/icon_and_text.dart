import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconDataColor;
  final String text;
  final double iconDataSize;
  const IconAndTextWidget({
    Key? key,
    required this.iconData,
    required this.iconDataColor,
    this.iconDataSize = 0,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: iconDataColor,
          size: iconDataSize == 0 ? Dimensions.iconSize20 : iconDataSize,
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        SmallText(text: text),
      ],
    );
  }
}
