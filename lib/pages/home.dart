import 'package:flutter/material.dart';
import 'package:store/pages/all_category.dart';
import 'package:store/pages/productdetail.dart';
import 'package:store/services/apiServices.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.redAccent,
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AllCategory()));
        }, icon: Icon(Icons.view_list))],
      ),
      body: FutureBuilder(
        future: ApiService().getAllPosts(),
        builder: (cotext, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(

                  elevation: 5,
                  child: ListTile(

                    title: Text(snapshot.data[index]['title']),
                    leading: Image.network(
                      snapshot.data[index]['image'],
                      height: 50,
                      width: 50,
                    ),
                    subtitle: Text(
                        "Price- Rs" + snapshot.data[index]['price'].toString()),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(snapshot.data[index]['id'])));
                    },
                  ),
                );
              },
            ));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
