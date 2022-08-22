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
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List products = snapshot.data['products'];
            print(products);
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (contex, index) {
                  return FutureBuilder(
                      future: ApiService().getSinglePost(products[index]['productId']),
                      builder: (context, AsyncSnapshot Asnapshot) {
                        if (Asnapshot.hasData) {
                          return ListTile(
                            title: Text(Asnapshot.data['title']),
                            leading: Image.network(Asnapshot.data['image'],
                              height: 50,
                              width: 50,),
                            subtitle: Text(products[index]['quantity'].toString()),
                            trailing: IconButton(onPressed: (){},icon: Icon(Icons.delete,color: Colors.red),),

                          );
                        }
                        return LinearProgressIndicator();
                      });
                });

          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        width: double.infinity,
        color: Colors.green,
        child: Center(
          child:Text("Order Now",style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ),) ,
        ),
      ),
    );
  }
}
