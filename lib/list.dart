import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'add.dart';
import 'dataAccessHelper.dart';

///新クラスーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

///旧クラスーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//Header
class _PostsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListTile(
            leading: ClipOval(
              child: Container(
                color: Colors.grey[300],
                width: 48,
                height: 48,
                child: Icon(
                  Icons.storage,
                  color: Colors.grey[800],
                ),
              ),
            ),
            //AppBarのポスト数
            title: Text('Tasks'),
            subtitle: Text('20 Posts'),
          ),
        ),
        Expanded(
          flex: 1,
          child: ListTile(
            leading: ClipOval(
              child: Container(
                color: Colors.grey[300],
                width: 48,
                height: 48,
                child: Icon(
                  Icons.style,
                  color: Colors.grey[800],
                ),
              ),
            ),
            title: Text('All Types'),
            subtitle: Text(''),
          ),
        ),
      ],
    );
  }
}

//PostList
class PostList_ extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 55),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _PostsHeader(),
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // "push"で新規画面に遷移
          AddPageState add = AddPageState();
          add.addTask('title', 'context', '2024-12-31', true);
          print('-----------------------------------------');
          add.addTask('title2', 'context2', '2024-01-01', false);

          //shared_preferences_getData
          List<String> _list = [];
          final dataAccess dbAcess = dataAccess();
          Future<dynamic> list = dbAcess.getData('todo') ?? [];
          print('getTask-------------------------------------');
          //print(list[0]);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("HelloWorld"),
    );
  }
}
