import 'package:flutter/material.dart';

class Todo {
  ///ID
  late int id;

  /// ToDo名
  late String name;

  /// 内容
  late String context;

  ///期日
  late String dueDate;

  ///作成日時
  late String date;

  ///期日フラグ
  late int dueFlg;

  ///タグカラー
  late Color tagColer;

  Todo(
    this.id,
    this.name,
    this.context,
    this.dueDate,
    this.date,
    this.dueFlg,
    this.tagColer,
  );

  set title(String title) {}

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'context': context,
      'dueDate': dueDate,
      'date': date,
      'dueFlg': dueFlg,
      'tagColer': tagColer,
    };
  }

  Todo.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    context = json['context'];
    dueDate = json['dueDate'];
    date = json['date'];
    dueFlg = json['dueFlg'];
    tagColer = json['tagColer'];
  }
}
