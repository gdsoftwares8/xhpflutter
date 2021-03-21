import 'package:flutter/material.dart';
import 'package:xhp/widgets/text_widget.dart';

class Invoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
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
               // padding: EdgeInsets.only(left: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/pending-invoice');
                  },
                                  child: Card(
                  
                    color: Color(0xFF522B83).withOpacity(0.85),
                    
                    elevation: 10,
                    child:Center(child: TextWidget(text:"Pending Invoice",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width*.80,
                height: MediaQuery.of(context).size.height*.20,
                margin: EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/gap-history");
                  },
                                  child: Card(
                  
                    color: Color(0xFF522B83).withOpacity(0.85),
                    
                    elevation: 10,
                    child:Center(child: TextWidget(text:"Gap-Paid",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                  ),
                ),
              ),
               Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width*.80,
                height: MediaQuery.of(context).size.height*.20,
                margin: EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/pending-invoice');
                  },
                                  child: Card(
                  
                    color: Color(0xFF522B83).withOpacity(0.85),
                    
                    elevation: 10,
                    child:Center(child: TextWidget(text:"Invoice History",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                  ),
                ),
              ),
               Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width*.80,
                height: MediaQuery.of(context).size.height*.20,
                margin: EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/non-partner");
                  },
                                  child: Card(
                  
                    color: Color(0xFF522B83).withOpacity(0.85),
                    
                    elevation: 10,
                    child:Center(child: TextWidget(text:"Non-Partner",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                  ),
                ),
              )
            ])
      )
      
    );
  }
}

