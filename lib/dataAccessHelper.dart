import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'todo.dart';

class TodoListStore {
  /// 保存時のキー
  final String _saveKey = "Todo";

  /// Todoリスト
  List<Todo> _list = [];

  /// ストアのインスタンス
  static final TodoListStore _instance = TodoListStore._internal();

  /// プライベートコンストラクタ
  TodoListStore._internal();

  /// ファクトリーコンストラクタ
  /// (インスタンスを生成しないコンストラクタのため、自分でインスタンスを生成する)
  factory TodoListStore() {
    return _instance;
  }

  /// Todoの件数を取得する
  int count() {
    return _list.length;
  }

  /// 指定したインデックスのTodoを取得する
  Todo findByIndex(int index) {
    return _list[index];
  }

  /// "yyyy/MM/dd HH:mm"形式で日時を取得する
  String getDateTime() {
    var format = DateFormat("yyyy/MM/dd HH:mm");
    var dateTime = format.format(DateTime.now());
    return dateTime;
  }

  Color setTagColor(tagColorNumber) {
    Color _tagColor = Colors.grey;
    if (tagColorNumber == 0) {
      return _tagColor = Colors.grey;
    } else if (tagColorNumber == 1) {
      return _tagColor = Colors.red;
    } else if (tagColorNumber == 2) {
      return _tagColor = Colors.orange;
    } else if (tagColorNumber == 3) {
      return _tagColor = Colors.green;
    } else if (tagColorNumber == 4) {
      return _tagColor = Colors.blue;
    } else if (tagColorNumber == 5) {
      return _tagColor = Colors.deepPurple;
    } else if (tagColorNumber == 6) {
      return _tagColor = Colors.black;
    } else {
      print('color error');
      return _tagColor = Colors.grey;
    }
  }

  /// Todoを追加する
  void add(
    String name,
    String context,
    String inDueDate,
    int dueFlg,
    int tagColorNum,
  ) {
    String dueDate = '';
    //id採番
    var id = count() == 0 ? 1 : _list.last.id + 1;
    //期日フラグ判定によって期日の設定
    /*if (dueFlg != 1) {
      String dueDate = inDueDate;
    }*/
    //作成日を追加
    String date = getDateTime();
    //タグカラーを追加
    Color tagColor = setTagColor(tagColorNum);
    //一度リストに格納する処理を追加する。
    var todo = Todo(id, name, context, dueDate, date, dueFlg, tagColor);
    //期日フラグを基に期日を設定する
    _list.add(todo);
    save();
  }

  /// Todoを削除する
  void delete(Todo todo) {
    _list.remove(todo);
    save();
  }

  /// Todoを保存する
  void save() async {
    print('----------------save method start!----------------');
    var prefs = await SharedPreferences.getInstance();
    print('create instance');
    // SharedPreferencesはプリミティブ型とString型リストしか扱えないため、以下の変換を行っている
    // TodoList形式 → Map形式 → JSON形式 → StrigList形式
    print('start change format');
    var saveTargetList = _list.map((a) => json.encode(a.toJson())).toList();
    print('finishd change format');
    prefs.setStringList(_saveKey, saveTargetList);
    print('----------------finishd method----------------');
  }

  /// Todoを読込する
  void load() async {
    var prefs = await SharedPreferences.getInstance();
    print('----------------load method start!----------------');
    // SharedPreferencesはプリミティブ型とString型リストしか扱えないため、以下の変換を行っている
    // StrigList形式 → JSON形式 → Map形式 → TodoList形式
    var loadTargetList = prefs.getStringList(_saveKey) ?? [];
    print('change format');
    _list = loadTargetList.map((a) => Todo.fromJson(json.decode(a))).toList();
    print('----------------finishd method----------------');
  }

  Future<String> loadDataSize() async {
    String setDataSize = '0';
    var prefs = await SharedPreferences.getInstance();
    var loadTargetList = prefs.getStringList(_saveKey) ?? [];
    _list = loadTargetList.map((a) => Todo.fromJson(json.decode(a))).toList();
    setDataSize = _list.length.toString();
    return setDataSize;
  }
}
