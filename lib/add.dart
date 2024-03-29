import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dataAccessHelper.dart';

//追加処理
class AddPageState {
  //DBアクセス
  final dataAccess dbAcess = dataAccess();

  void addTask(String title, String context, String data, bool dueflg) {
    //タスクタイトル
    String _title = '';
    //タスク説明
    String _context = '';
    //期日
    String _date = '';
    //期日入力フラグ(初期値 0 = false)
    String _dueFlag = '0';
    //タスク
    List<String> _task = List.empty();

    //期日判定
    if (dueflg != false) {
      //期日入力フラグがtrueの場合、タスクに期日を設定する
      _dueFlag = '1';
      _date = data;
    }
    _title = title;
    _context = context;
    //タスクリストに格納
    _task = [_title, _context, _date, _dueFlag];

    dbAcess.setData(_task);

    //テスト用
    for (int i = 0; i < 4; i++) {
      print(
        _task[i],
      );
    }
    //DBアクセス・データセット
    //dbAcess.setData(_task);
  }
}
