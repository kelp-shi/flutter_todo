import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_uitest/add.dart';
import 'package:flutter_application_uitest/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
//import 'add.dart';
import 'dataAccessHelper.dart';
import 'header.dart';

///新クラスーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {
  //task件数
  int itemSize = 0;

  /// ストア
  final TodoListStore _store = TodoListStore();
  final PostsHeader header = PostsHeader();

  /// Todoリスト入力画面に遷移する
  void _pushTodoInputPage([Todo? todo]) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return TodoInputPage(todo: todo);
        },
      ),
    );
    // Todoの追加/更新を行う場合があるため、画面を更新する
    setState(() {});
  }

//--------------非同期widget----------------------
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _store.loadDataSize(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        //非同期待機中
        debugPrint('----------非同期処理widget 開始----------');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
          //非同期エラー処理
        } else if (snapshot.hasError) {
          return Text('Error occurred');
          //非同期正常読み込み
        } else {
          return Column(
            children: [
              //header読み込み
              Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: header,
              ),
              //body読み込み
              Expanded(
                  child: ListView.builder(
                itemCount: _store.count(),
                itemBuilder: (context, index) {
                  // インデックスに対応するTodoを取得する
                  var item = _store.findByIndex(index);
                  return Slidable(
                      // 左方向にリストアイテムをスライドした場合のアクション
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        extentRatio: 0.25,
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              // Todoを削除し、画面を更新する
                              setState(() {
                                _store.delete(item);
                              });
                              print(_store.count());
                            },
                            backgroundColor: Colors.red,
                            icon: Icons.edit,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      //-----------------todo's-----------------------
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Card(
                          elevation: 8,
                          shadowColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                leading: ClipOval(
                                  child: Container(
                                    color: Color.fromARGB(
                                      item.tagColer[0],
                                      item.tagColer[1],
                                      item.tagColer[2],
                                      item.tagColer[3],
                                    ),
                                    width: 25,
                                    height: 25,
                                  ),
                                ),
                                title: Text(item.name),
                                subtitle: Text(item.date),
                              ),
                            ],
                          ),
                        ),
                      ));
                },
              )),
              //追加ボタン
              ElevatedButton(
                  onPressed: _pushTodoInputPage, child: const Icon(Icons.add)),
            ],
          );
        }
      },
    );
  }
}
