import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xhp/widgets/button_widget.dart';
import 'package:xhp/widgets/text_widget.dart';

class Error extends StatelessWidget {
  final String errorMessage;

  final Function onRetryPressed;

  const Error({Key key, this.errorMessage, this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextWidget(
            text: errorMessage,
            textAlign: TextAlign.center,
            textSize: 18,
            color: Colors.black,
          ),
          SizedBox(height: 20),
          ButtonWidget(
            text: 'Retry',
            onPressed: onRetryPressed,
          )
        ],
      ),
    );
  }
}
