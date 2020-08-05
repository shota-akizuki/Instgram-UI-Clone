import 'package:flutter/material.dart';
import 'package:model_lecture/presentation/screen/add_page.dart';
import 'package:model_lecture/presentation/screen/favorite_page.dart';
import 'package:model_lecture/presentation/screen/home_page.dart';
import 'package:model_lecture/presentation/screen/profile_page.dart';
import '../model/main_model.dart';
import 'package:provider/provider.dart';
import 'search_page.dart';

class MainPage extends StatelessWidget {
  final pages = [
    HomePage(),
    SearchPage(),
    AddPage(),
    FavoritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        builder: (context, snapshot) {
          return Consumer<MainModel>(builder: (context, model, child) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.black54,
                    )),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      //todo:DMを送信する
                    },
                  ),
                ],
                backgroundColor: Colors.white,
                title: Text(
                  'Instagram',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              body: pages[model.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
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
                    icon: Icon(Icons.add),
                    title: Text('Add'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    title: Text('Favorite'),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    title: Text('Profile'),
                  ),
                ],
                onTap: (index) {
                  model.selectIndex(index);
                },
              ),
            );
          });
        });
  }
}
