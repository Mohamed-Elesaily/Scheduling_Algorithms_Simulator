import 'package:example_flutter/scheduling_algorithm/fcfs_algorithm.dart';
import 'package:example_flutter/widgets/chart.dart';
import 'package:flutter/material.dart';
class FCFSPage extends StatefulWidget {

  @override
  _FCFSPageState createState() => _FCFSPageState();
}

class _FCFSPageState extends State<FCFSPage> {
    
  final double raduis = 8;
  

  List<FCFS> fcfs =[];
  List<FCFS> fcfsitem =[];
  List<int> endtime =[];
  List<int> starttime =[];
  final TextEditingController _burst = new TextEditingController();
  
  void getTime(){
    starttime.add(0);
    endtime.add(fcfsitem[0].getburst);
    for(int i=1;i<fcfsitem.length;i++){
        starttime.add(endtime[i-1]);
        endtime.add(fcfsitem[i].getburst+starttime[i]);
       
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FCFS'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.settings_backup_restore), onPressed:(){
            
            setState(() {
              fcfs.clear(); 
              fcfsitem.clear();
              endtime.clear();
              starttime.clear(); 
            });
            }
            )
        ],
      ),
      drawer: Drawer(

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_left),
        onPressed: (){
          setState(() {
            fcfs = List.from(fcfsitem,growable: true);  
           getTime();
          });
          
        },
        tooltip: 'run algorithm',
        
        ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget>[
              Card(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Text('Burst Time'),
                      SizedBox(height:20),
                    Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(raduis))),
                height: 50,
                width: 100,
                child: TextField(
                  controller: _burst,
                ),
              ),
                      SizedBox(height:50),
                      FloatingActionButton(
                        child: Icon(Icons.check),
                        onPressed:(){
                             
                            
                            
                            setState(() {

                              fcfsitem.add(new FCFS(_burst.text)); 
                          

                            });
                        } 
                      )
                    ]
                  ),
                  height:300,
                  width:350,
                ),
              ),
              Card(
                child: Container(
                  child:ListView.builder(
                    itemCount:  fcfsitem.length,
                    itemBuilder:(context, index){
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                     Text('P$index',
                                      style: TextStyle(
                                        fontSize:20
                                      ),
                                     ),
                                     SizedBox(height:20),
                                     Text('Burst:${fcfsitem[index].getburst} '),

                              ],
                          ),
                        ),
                      );
                    } 
                  ) ,
                  height:300,
                  width:350,
                ),
              )
            ]
          ),
          SizedBox(height:10),
          Divider(),
//      new TextFormField(

//   controller:  _burst,
//   keyboardType: TextInputType.numberWithOptions(decimal: false),
//   decoration: const InputDecoration(
//       filled: true,
//       fillColor: Colors.black,
//       border: const OutlineInputBorder(),
   
//       suffixStyle:
//       const TextStyle(color: Colors.green)),
//   maxLines: 10,
 
// ),
SizedBox(height:70),
    Container(
      height:100,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: fcfs.length,
      itemBuilder: (context, index){
        return Chart(end:endtime[index] ,process: 'p$index',start: starttime[index]);
      },
      )
    )
        
        ],
      )
    );
  }
}
