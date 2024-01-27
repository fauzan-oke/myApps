import 'package:flutter/material.dart';

class EditTrx extends StatelessWidget{
  final Map trx;

  EditTrx({required this.trx});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('EDIT TRANSAKSI', style: TextStyle(
        color: Colors.white, // Set text color to white
        fontWeight: FontWeight.bold, // Make text bold
      ), ),
        backgroundColor: Colors.blue,
        centerTitle: true,),
      body: Center(child: Text(trx['nama']),),
    );
  }
}