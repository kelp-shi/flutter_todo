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
            title: Text('Posts'),
            subtitle: Text('$taskSize Posts'),
          ),
        ),
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
    );
  }
}
