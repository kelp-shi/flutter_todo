import 'package:flutter/material.dart';
import 'dataAccessHelper.dart';

class PostsHeader extends StatefulWidget {
  //int taskSize = 0;
  //PostsHeader({Key? key, required this.taskSize}) : super(key: key);
  @override
  _PostsHeaderState createState() => _PostsHeaderState();
}

class _PostsHeaderState extends State<PostsHeader> {
  final TodoListStore _store = TodoListStore();
  int taskSize = 0;

  @override
  void initState() {
    super.initState();
    taskSize = _store.count();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('----------header処理開始----------');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 16),
          child: Text(
            'Task Manager',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              width: 48,
              height: 48,
              child: Icon(
                Icons.storage,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Container(
                padding: EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('Tasks'), Text('$taskSize Tasks')],
                ))
          ],
        )
        /*
        Container(
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle, // 丸くする
                color: Colors.grey[300],
              ),
              width: 48,
              height: 48,
              child: Icon(
                Icons.storage,
                color: Colors.grey[800],
              ),
            ),
          ),
        )*/
      ],
    );

    /*return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, // 左右端に配置する
      children: [
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Task Manager',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(right: 16),
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
                title: Text('Posts'),
                subtitle: Text('$taskSize Posts'),
              ),
            )),
        /*Expanded(
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
        ),*/
      ],
    );*/
  }
}
