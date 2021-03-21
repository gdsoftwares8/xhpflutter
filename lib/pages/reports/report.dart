import 'package:flutter/material.dart';
import 'package:xhp/widgets/text_widget.dart';

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                child: GestureDetector(
                onTap: (){
                    Navigator.pushNamed(context, "/contributions");
                  },
                                  child: Card(
                  
                    color: Color(0xFF522B83).withOpacity(0.85),
                    
                    elevation: 10,
                    child:Center(child: TextWidget(text:"Contributions",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
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
                    Navigator.pushNamed(context, "/financial");
                  },
                                  child: Card(
                  
                    color: Color(0xFF522B83).withOpacity(0.85),
                    
                    elevation: 10,
                    child:Center(child: TextWidget(text:"Financial Statement",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                  ),
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
                  child:Center(child: TextWidget(text:"Expenses",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                ),
              ),
               Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: MediaQuery.of(context).size.width*.80,
                height: MediaQuery.of(context).size.height*.20,
                margin: EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/appointment-report");
                  },
                                  child: Card(
                  
                    color: Color(0xFF522B83).withOpacity(0.85),
                    
                    elevation: 10,
                    child:Center(child: TextWidget(text:"Appointment Report",color: Colors.white,fontWeight: FontWeight.bold,textSize: 20,))
                  ),
                ),
              ),
              
            ])
      )
      
    );
  }
}