import 'package:flutter/material.dart';
import 'package:xhp/widgets/text_widget.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
               
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width*.80,
                height: MediaQuery.of(context).size.height*.20,
                margin: EdgeInsets.all(20),
                child: Card(
                
                  color: Color(0xFF522B83).withOpacity(0.85),
                  
                  elevation: 10,
                  child:Center(child: TextWidget(text:"Profile Management",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width*.80,
                height: MediaQuery.of(context).size.height*.20,
                margin: EdgeInsets.all(20),
                child: Card(
                
                  color: Color(0xFF522B83).withOpacity(0.85),
                  
                  elevation: 10,
                  child:Center(child: TextWidget(text:"Add Members",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                ),
              ),
               Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width*.80,
                height: MediaQuery.of(context).size.height*.20,
                margin: EdgeInsets.all(20),
                child: Card(
                
                  color: Color(0xFF522B83).withOpacity(0.85),
                  
                  elevation: 10,
                  child:Center(child: TextWidget(text:"Contribution",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width*.80,
                height: MediaQuery.of(context).size.height*.20,
                margin: EdgeInsets.all(20),
                child: Card(
                
                  color: Color(0xFF522B83).withOpacity(0.85),
                  
                  elevation: 10,
                  child:Center(child: TextWidget(text:"Withdrawal",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                ),
              )
            ])
      )
      
    );
  }
}