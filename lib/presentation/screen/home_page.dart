import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:model_lecture/presentation/model/main_model.dart';

class HomePage extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainModel(),
      builder: (context, snapshot) {
        return Scaffold(
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
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
                      spacing: 12,
                      children: <Widget>[
                        Icon(Icons.favorite),
                        Icon(Icons.comment),
                        Icon(Icons.send),
                      ],
                    ),
                    trailing: Icon(Icons.bookmark_border),
                  ),
                  ListTile(
                    leading: Text('いいね！'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
