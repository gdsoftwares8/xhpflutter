import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top:5,bottom:5),
        child: Divider(
          height: 5,
        ),
      ),
    );
  }
}
