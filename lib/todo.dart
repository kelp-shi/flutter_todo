import 'package:flutter/material.dart';

class Todo {
  ///ID
  late String id;

  /// ToDo名
  late String name;

  /// 内容
  late String context;

  ///期日
  late String dueDate;

  ///期日フラグ
  late String dueFlg;

  ///完了フラグ
  late String delFlg;

  Todo(
    this.id,
    this.name,
    this.context,
    this.dueDate,
    this.dueFlg,
    this.delFlg,
  );

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'context': context,
      'dueDate': dueDate,
      'dueFlg': dueFlg,
      'delFlg': delFlg,
    };
  }

  Todo.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    context = json['context'];
    dueDate = json['dueDate'];
    dueFlg = json['dueFlg'];
    delFlg = json['delFlg'];
  }
}
