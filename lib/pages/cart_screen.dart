import 'package:flutter/material.dart';
import 'package:store/services/apiServices.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService().getCart('1'),
        builder: (context,AsyncSnapshot snapshot){
          if(snapshot.hasData){
            return Center(child: Text('Succes'),);
          }return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
