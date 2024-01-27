import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/screens/add_trx.dart';
import 'package:myapp/screens/edit_trx.dart';
class HomePage extends StatelessWidget {

  const HomePage({
    super.key,
  });

  final String url = 'http://10.0.2.2:8000/api/tugas/trx';

  Future getTrx() async {
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTrx()));
        },
        child: Icon(Icons.add),
      ),
        appBar: AppBar(
          title: Text('SEARCHING DATA', style: TextStyle(
            color: Colors.white, // Set text color to white
            fontWeight: FontWeight.bold, // Make text bold
          ), ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future:getTrx(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index){
                    int id = snapshot.data['data'][index]['id'];
                    int total = snapshot.data['data'][index]['total'];
                   return Container(
                     height: 200,
                     child: Card(
                       elevation: 5,
                       child: Row(
                         children: [
                           Expanded(
                             child: GestureDetector(
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> EditTrx(trx: snapshot.data['data'][index])));
                               },
                               child: Container(
                                 padding: EdgeInsets.all(10.0),
                                 child: Column(
                                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                     Align(
                                       alignment: Alignment.topLeft,
                                         child: Text(id.toString(),style: TextStyle(fontSize: 20.0),)),
                                     Align(
                                         alignment: Alignment.topLeft,
                                         child: Text(snapshot.data['data'][index]['nama'],style: TextStyle(fontSize: 20.0),)),
                                     Align(
                                       alignment: Alignment.topLeft,
                                       child: Text(snapshot.data['data'][index]['tanggal'],style: TextStyle(fontSize: 20.0),)),
                                     Align(
                                       alignment: Alignment.topLeft,
                                         child: Text(snapshot.data['data'][index]['item'],style: TextStyle(fontSize: 20.0),)),
                                     Align(
                                         alignment: Alignment.topLeft,
                                         child: Text(total.toString(),style: TextStyle(fontSize: 20.0),))
                                   ],
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),

                     ),
                   );
              });
            }else{
              return Text('failed');
            }
          }
        )) ;
  }
}