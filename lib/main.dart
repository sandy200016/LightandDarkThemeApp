import 'dart:convert';

import 'package:catalog/Screen/home_page.dart';
import 'package:catalog/Screen/login.dart';
import 'package:catalog/Utilits/route_pages.dart';
import 'package:catalog/widgets/list_view.dart';
import 'package:catalog/widgets/mydrawer.dart';
import 'package:catalog/widgets/mytheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/catalogitem.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {





  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context,ThemeNotifier notifier,child){
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: notifier.getTheme()? ThemeMode.dark : ThemeMode.light,
            theme: Mytheme1.lightTheme(context),
            darkTheme: Mytheme1.darkTheme(context),
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );

        },

      ),
    );
  }


}

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
      floatingActionButton: Consumer<ThemeNotifier>(
        builder: (context,notifier,child)=>FloatingActionButton(
          onPressed: () {
          notifier.toggleTheme();
          },

          child: notifier.getTheme()?Icon(CupertinoIcons.moon_fill):Icon(Icons.wb_sunny),
        ),
      )


    );
  }


}


