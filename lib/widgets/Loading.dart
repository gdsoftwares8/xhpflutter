import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xhp/utils/GlobalFuncs.dart';
import 'package:xhp/widgets/text_widget.dart';

class Loading extends StatelessWidget {
  final String loadingMessage;

  const Loading({Key key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextWidget(
            text: loadingMessage,
            textAlign: TextAlign.center,
            textSize: 24,
            color: Colors.black,
          ),
          SizedBox(height: 24),
          GlobalFunc.ProgressBar()
          // CircularProgressIndicator(
          //   valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurpleAccent),
          // ),
        ],
      ),
    );
  }
}