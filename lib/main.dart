import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemangment/myprovider.dart';
import 'package:statemangment/product_widget.dart';

void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(), child: MaterialApp(home: MyApp())));
}

class MyApp extends StatelessWidget {
  String text = '';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
     DefaultTabController(
       length: 2,
       child: Scaffold(
          appBar: AppBar(
            title: Text('Provider App'),
            bottom: TabBar(tabs: [Tab(child: Icon(Icons.home),),
            Tab(child: Icon(Icons.favorite),),]),
          ),
       
        body: 
        TabBarView(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder
              (
                 itemCount:Provider.of<MyProvider>(context).products.length,
                itemBuilder: (context,index){
                  int id = Provider.of<MyProvider>(context).products[index].id;
                  print("ids : $id");
                  return ProductWidget(Provider.of<MyProvider>(context).products[index].id);
                     // Provider.of<MyProvider>(context).products[index],
                    // index);
                })
               
            ),
                Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder
              (
                 itemCount:Provider.of<MyProvider>(context).products.where((element) => element.isFavourite)
                 .length,
                itemBuilder: (context,index){
                  int id = Provider.of<MyProvider>(context).products[index].id;
                  print("ids : $id");
                  return ProductWidget(Provider.of<MyProvider>(context).products[index].id);
                    // Provider.of<MyProvider>(context).products[index],
                    // index);
                })
               
            ),
          ],
        ),
         //  bottomNavigationBar:BottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(Icons.home),label:'')
         //  ,BottomNavigationBarItem(icon: Icon(Icons.favorite),label:''),],),
         ),
     );
       
  }
}