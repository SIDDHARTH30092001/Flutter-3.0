import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "sid";

  @override
  void initState() {
    ////LIFE CYCLE B4 BUILD METHOD
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    //print(catalogJson);
    final decodedData = jsonDecode(
        catalogJson); //STRING TO OBJ\MAP(key,val) //jsonEncode for OBJ\MAP(key,val) TO STRING
    //print(decodedData);
    var productsData = decodedData["products"];
    //print(productsData);
    //List<Item> list=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList(); //REMOVED FINAL KEYWORD, ADDED LIST<ITEM> IN CATALOG.DART 1ST CONSTRUCTOR
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {
      //TO RELOAD DATA/BUILD METHOD CALLED
    });
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(
    //     10,
    //     (index) => CatalogModel.items[
    //         0]); //SAME ITEM 10 TIMES, CHECKING PURPOSE-HOW IT LOOKS,FEELS
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent, //REMOVED THE CHANGES TO KEEP APP BAR CONST SOMEWHERE/REUSE PURPOSE
        // elevation: 0.0,
        // iconTheme: const IconThemeData(
        //   color: Colors.black,
        // ),
        centerTitle: true,
        title: const Text(
          "Catalog App",
          // style: TextStyle(
          //   color: Colors.black,
          // ),
        ),
      ),
      // body: Center(
      //   //child: Text("Welcome to Flutter"),
      //   //child: Container(
      //     child: Text("Welcome to flutter $name"),
      //     //child: Text(context.runtimeType.toString())//TO PRINT CONTEXT (ELEMENT TREE/LOCATION OF THINGS)
      //   //),
      // ), //INSTEAD OF CENTER THERE'LL BE A LIST FOR PRODUCTS
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        //child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
        child: (CatalogModel.items.isNotEmpty)
            ? ListView.builder(
                //BUILDER PROVIDES RECYCLER VIEW
                itemCount: CatalogModel.items.length,
                //itemCount: dummyList.length,
                itemBuilder: (context, index) => //{
                    //return ItemWidget(
                    ItemWidget(
                      item: CatalogModel.items[index],
                      //item: dummyList[index],
                    ) //;
                //}
                //,
                )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
