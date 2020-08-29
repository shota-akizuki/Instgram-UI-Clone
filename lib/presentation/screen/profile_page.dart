import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:model_lecture/presentation/model/main_model.dart';

class ProfilePage extends StatelessWidget {
  final designURLs = _createSampleURLs();
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
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Container(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('images/mai.jpeg'),
                                        backgroundColor: Colors.grey,
                                        radius: 50,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text('Mai'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('0'),
                                    Container(
                                      child: Text('投稿'),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('0'),
                                    Container(
                                      child: Text('フォロワー'),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('0'),
                                    Container(
                                      child: Text('フォロー中'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text('プロフィール'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.white,
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      child: Image(
                        image: NetworkImage(designURLs[index]),
                        fit: BoxFit.fitWidth,
                      ),
                    );
                  },
                  childCount: designURLs.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

_createSampleURLs() {
  final _urls = [];
  const _url =
      'https://s3-ap-northeast-1.amazonaws.com/greensnap-co-jp/img/category_flower.jpg';
  for (var i = 0; i < 100; i++) {
    _urls.add(_url);
  }
  return _urls;
}

final designURLs = _createSampleURLs();
