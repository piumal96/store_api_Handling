import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:store/services/apiServices.dart';

class ProductDetail extends StatelessWidget {
  final int id;

  ProductDetail(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
        future: ApiService().getSinglePost(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Image.network(
                      snapshot.data['image'],
                      height: 200,
                      width: double.infinity,
                    ),
                    Text(
                      "Rs " + snapshot.data['price'].toString(),
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      snapshot.data['title'],
                      style: TextStyle(fontSize: 25),
                    ),
                    Chip(label: Text(snapshot.data['category'],style: TextStyle(fontSize: 15,color: Colors.white),),backgroundColor: Colors.blueGrey,),
                  SizedBox(height: 30,),
                    Text(snapshot.data['description'])
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {  },
        child: Icon(Icons.add_shopping_cart),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}
