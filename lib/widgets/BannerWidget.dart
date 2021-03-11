import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String imageurl;

  BannerWidget({this.imageurl});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          child: Stack(
            children: [
              Image.network(
                imageurl,
                fit: BoxFit.fitHeight,
                height: 400,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text("Xtras Health Plan")))
            ],
          )),
    );
  }
}
