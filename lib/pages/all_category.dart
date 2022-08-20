import 'package:flutter/material.dart';
import 'package:store/pages/category+product.dart';
import 'package:store/services/apiServices.dart';

class AllCategory extends StatelessWidget {
  const AllCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiService().getAllCategories(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryProductPage(snapshot.data[index])));
                    },
                    child: Card(
                      elevation: 2,
                      margin: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: Center(
                          child: Text(
                            snapshot.data[index].toString().toUpperCase(),
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
