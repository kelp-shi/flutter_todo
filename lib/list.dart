import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_uitest/add.dart';
import 'package:flutter_application_uitest/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
          //非同期エラー処理
        } else if (snapshot.hasError) {
          return Text('エラーが発生しました');
          //非同期正常読み込み
        } else {
          return Column(
            children: [
              header,
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
                          label: '削除',
                        ),
                      ],
                    ),
                    //-----------------todo's-----------------------
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Color.fromARGB(255, 203, 33, 33)),
                        ),
                      ),
                      child: ListTile(
                        // ID
                        leading: Text(item.id.toString()),
                        // タイトル
                        title: Text(item.name),
                      ),
                    ),
                  );
                },
              ))
            ],
          );
        }
      },
    );
  }
}

/*class _post extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  setState(() => {_store.delete(item)});
                  print(_store.count());
                },
                backgroundColor: Colors.red,
                icon: Icons.edit,
                label: '削除',
              ),
            ],
          ),
          //-----------------todo's-----------------------
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 203, 33, 33)),
              ),
            ),
            child: ListTile(
              // ID
              leading: Text(item.id.toString()),
              // タイトル
              title: Text(item.name),
            ),
          ),
        );
      },
    );
  }
}*/

/*
  /// 画面を作成する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------------header-----------------------
      appBar: AppBar(
        // アプリケーションバーに表示するタイトル
        backgroundColor: Colors.blue,
        title: const Text(
          'Task Manager',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        actions: [
          Icon(
            Icons.text_snippet_outlined,
            color: Colors.white,
          ),
          Title(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Text(
                  'Tasks \n $itemSize items',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
      //-----------------body-----------------------
      body: ListView.builder(
        // Todoの件数をリストの件数とする
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
                    setState(() => {_store.delete(item)});
                    print(_store.count());
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.edit,
                  label: '削除',
                ),
              ],
            ),
            //-----------------todo's-----------------------
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 203, 33, 33)),
                ),
              ),
              child: ListTile(
                // ID
                leading: Text(item.id.toString()),
                // タイトル
                title: Text(item.name),
              ),
            ),
          );
        },
      ),
      // Todo追加画面に遷移するボタン
      floatingActionButton: FloatingActionButton(
        // Todo追加画面に遷移する
        onPressed: _pushTodoInputPage,
        child: const Icon(Icons.add),
      ),
    );
  }*/

