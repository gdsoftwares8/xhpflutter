import 'package:flutter/material.dart';
import 'package:xhp/widgets/text_widget.dart';

class CommonFuture<T> extends StatelessWidget {
  // final Widget successWidget;
  final Widget Function(T data) data;
  final Future<T> future;
  final T initialData;
  const CommonFuture({required this.future, required this.initialData, required this.data});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      initialData: initialData,
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return TextWidget(text: 'Error Occured');
          }
          return data(snapshot.data!);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
