import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dataAccessHelper.dart';

//追加処理
class AddPageState {
  //DBアクセス
  final dataAccess dbAcess = dataAccess();

  void addTask(String title, String context, String data, bool dueflg) async {
    //期日入力フラグ(初期値 0 = false)
    String _dueFlg = '0';
    //タスク
    List<String> _task = List.empty();

    _task = [title, context];

    //期日判定
    if (dueflg != false) {
      //期日入力フラグがtrueの場合、タスクに期日を設定する
      _dueFlg = '1';
      _task.add(data);
      _task.add(_dueFlg);
    }

    dbAcess.setData(_task);

    //テスト用
    /*for (int i = 0; i < 4; i++) {
      print(
        _task[i],
      );
    }*/
    //DBアクセス・データセット
    //dbAcess.setData(_task);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('todo', _task);
    print('set data');
  }
}
