import 'package:flutter/material.dart';
import 'package:store/services/apiServices.dart';

class CategoryProductPage extends StatelessWidget {
  final String categoryName;

  CategoryProductPage(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName.toUpperCase()),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(future: ApiService().getProductById(categoryName),builder:(context,AsyncSnapshot snapshot){
        if(snapshot.hasData){
          return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context,index){
            return ListTile(

              title: Text(snapshot.data[index]['title']),
              leading: Image.network(
                snapshot.data[index]['image'],
                height: 50,
                width: 50,
              ),
              subtitle: Text(
                  "Price- Rs" + snapshot.data[index]['price'].toString()),
            );
          });
        }return Center(child: CircularProgressIndicator(),);
      } ,),
    );
  }
}
