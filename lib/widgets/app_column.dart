import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  // final double size;  required this.size
  const AppColumn({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Dimensions.height10,
        ),
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: Colors.blue,
                        size: Dimensions.iconSize12,
                      )),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: '1287'),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: 'Comments'),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                iconData: Icons.circle_sharp,
                iconDataColor: AppColors.iconColor1,
                text: 'Normal'),
            IconAndTextWidget(
                iconData: Icons.location_on,
                iconDataColor: AppColors.mainColor,
                text: '1.7km'),
            IconAndTextWidget(
                iconData: Icons.access_time_rounded,
                iconDataColor: AppColors.iconColor2,
                text: '32min'),
          ],
        ),
      ],
    );
  }
}
