import 'package:flutter/material.dart';
import 'package:insigths_news/core/utils/app_colors.dart';
import 'package:insigths_news/core/utils/text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Function() onpressed;
  final String text;
  const CustomElevatedButton({
    super.key,
    this.height,
    this.width,
    required this.onpressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 50,
        width: width ?? 200,
        child: ElevatedButton(
            onPressed: onpressed,
            child: Text(
              text,
              style: getSmallStyle(color: AppColors.white),
            )));
  }
}
