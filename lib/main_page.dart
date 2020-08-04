import 'package:flutter/material.dart';
import 'main_model.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        builder: (context, snapshot) {
          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  expandedHeight: 150.0,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                        'https://assets.st-note.com/production/uploads/images/7134112/rectangle_large_type_2_cf4617af00f19a8c731c22aa5d1cf29b.jpg?fit=bounds&format=jpeg&quality=45&width=960'),
                    title: Text('My Flutter App'),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(title: Text('Item #$index')),
                    // Builds 1000 ListTiles
                    childCount: 1000,
                  ),
                ),
              ],
            ),
            bottomNavigationBar:
                Consumer<MainModel>(builder: (context, model, child) {
              return BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: model.currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    title: Text('Search'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.camera),
                    title: Text('Camera'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Person'),
                  ),
                ],
                onTap: (index) {
                  model.selectedIndex(index);
                },
              );
            }),
          );
        });
  }
}

//final tabs = [
//  Center(
//    child: Text(
//      'Home',
//      style: TextStyle(fontSize: 30),
//    ),
//  ),
//  Center(
//    child: Text(
//      'Search',
//      style: TextStyle(fontSize: 30),
//    ),
//  ),
//  Center(
//    child: Text(
//      'Camera',
//      style: TextStyle(fontSize: 30),
//    ),
//  ),
//  Center(
//    child: Text(
//      'Person',
//      style: TextStyle(fontSize: 30),
//    ),
//  ),
////];
