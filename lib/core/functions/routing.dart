import 'package:flutter/material.dart';

pushto(context, Widget nextscreen) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => nextscreen,
  ));
}

pushWithReplacement(context, Widget nextscreen) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (context) => nextscreen,
  ));
}

pop(context) {
  Navigator.of(context).pop();
}
