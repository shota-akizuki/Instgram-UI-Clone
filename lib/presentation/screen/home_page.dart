import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:model_lecture/presentation/model/main_model.dart';
import '../model/main_model.dart';

class HomePage extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainModel(),
      builder: (context, snapshot) {
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
                  //todo:DMを送信
                },
              ),
            ],
            backgroundColor: Colors.white,
            title: Text(
              'Instagram',
              style: TextStyle(color: Colors.black54),
            ),
          ),
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Consumer<MainModel>(builder: (context, model, child) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      contentPadding: EdgeInsets.all(8),
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                        backgroundImage: AssetImage('images/mai.jpeg'),
                      ),
                      title: Text('mai_02'),
                      trailing: Icon(Icons.more_horiz),
                    ),
                    Container(
                      child: Image.network(
                          'https://s3-ap-northeast-1.amazonaws.com/greensnap-co-jp/img/category_flower.jpg'),
                    ),
                    ListTile(
                      leading: Wrap(
                        spacing: 0,
                        children: <Widget>[
                          Stack(
                            alignment: Alignment(0, 0),
                            children: <Widget>[
                              Icon(Icons.favorite),
                              IconButton(
                                icon: Icon(
                                  model.favorite == true
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: model.favorite == true
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                                onPressed: () {
                                  model.changeFavorite();
                                },
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.mode_comment),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.bookmark_border),
                    ),
                    ListTile(
                      leading: Text('いいね！'),
                    ),
                  ],
                );
              });
            },
          ),
        );
      },
    );
  }
}
