import 'package:catalog/models/catalogitem.dart';
import 'package:catalog/widgets/list_view.dart';
import 'package:catalog/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    loadData();

  }
  void loadData() async{
    await Future.delayed(Duration(seconds: 2));
  var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
  var decodedData= jsonDecode(catalogJson);
  var productsData=decodedData["products"];
  CatalogModel.products=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
  setState(() {

  });


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        ///ListView
        child: (CatalogModel.products != null && CatalogModel.products.isNotEmpty)? ListView.builder(
          padding: EdgeInsets.all(5.0),
          itemCount: CatalogModel.products.length,
          itemBuilder: (context,index){
            return ItemView(item: CatalogModel.products[index],);
          },
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
        )
        : Center(
          child: CircularProgressIndicator(),
        ),

      ),

      ///Navigation drawer
      drawer: MyDrawer(),
    );
  }


}
