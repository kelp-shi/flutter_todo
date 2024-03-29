import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class dataAccess {
  //データ取得
  getData(getList) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getStringList(getList);
  }

  //データ保存・更新
  setData(List<String> data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('data', data);
  }

  //データ削除
  delData(delTask) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(delTask);
  }
}
