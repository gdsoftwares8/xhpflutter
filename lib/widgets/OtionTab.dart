import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xhp/utils/global_vars.dart';
import 'package:xhp/widgets/text_widget.dart';

class OptionTab extends StatelessWidget {
  final String tabText ;
  final IconData icon;
  final VoidCallback onPressed;

  const OptionTab({
    @required this.tabText,
    @required this.icon,
    @required this.onPressed}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)),
      width: MediaQuery.of(context).size.width * .40,
      height: MediaQuery.of(context).size.height * .25,
      margin: EdgeInsets.all(10),
      // padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: onPressed,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: GlobalVars.accentColor,
          elevation: 10,
          child: Stack(
            //  textDirection: TextDirection.ltr,
              alignment: AlignmentDirectional.center,
              children: [
                Center(
                    child: Icon(icon,
                      size: 50,
                      color: Colors.white,
                    )),
                Positioned(
                    bottom: 10,
                    child: Center(
                        child: TextWidget(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10),
                          textAlign: TextAlign.center,
                          text: tabText!=null ? tabText : "",
                           softWrap: true,
                          maxLines:2,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          textSize: 16,
                        ))),
              ]),
        ),
      ),
    );
  }
}