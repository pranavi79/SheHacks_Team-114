import 'package:flutter/material.dart';
final kHintTextStyle = TextStyle(
  color: Colors.grey[300],
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
  shadows: <Shadow>[
    Shadow(
      offset: Offset(1.0, 1.0),
      blurRadius: 2.0,
      color: Colors.black45,
      ),
  ],
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xff99ffff),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

//contains styles and variables