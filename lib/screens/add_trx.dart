import 'package:flutter/material.dart';

class AddTrx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD TRANSAKSI', style: TextStyle(
          color: Colors.white, // Set text color to white
          fontWeight: FontWeight.bold, // Make text bold
        ), ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Form(
         child: Column(
           children: [
             TextFormField(decoration: InputDecoration(labelText: "Tanggal"),
             ),
             TextFormField(decoration: InputDecoration(labelText: "Nama"),
             ),
             TextFormField(decoration: InputDecoration(labelText: "Item"),
             ),
             TextFormField(decoration: InputDecoration(labelText: "Harga"),
             ),
             TextFormField(decoration: InputDecoration(labelText: "Qty"),
             ),
             TextFormField(decoration: InputDecoration(labelText: "Total"),
             ),
             TextFormField(decoration: InputDecoration(labelText: "Bayar"),
             ),
            SizedBox(
              height: 20,
            ),
             ElevatedButton(onPressed: (){}, child: Text('Simpan'))
           ],
         ),
      ),
    );
  }
}
