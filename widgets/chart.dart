import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  String process;
  int start,end;
  Chart({this.process,this.start,this.end});
  @override
  Widget build(BuildContext context) {
    return Container(
        
        width: 150,
        height: 80,
        decoration: BoxDecoration(
          border:Border.all(color: Colors.black,width: 2),
          color: Colors.blue[600],
        ), 
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            SizedBox(height:20),
            Text(process,
            style: TextStyle(
              fontSize:30
            ),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                Text('$start'),
                Text('$end'),
              ]
            )
          ]
        ) ,
        
        );

  }
}