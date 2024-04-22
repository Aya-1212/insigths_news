import 'package:flutter/material.dart';
import 'package:insigths_news/core/utils/text_style.dart';

showSnackBar(context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.redAccent.shade700,
      content: Text(
        text,
        style: getBodyStyle(),
      )));
}
