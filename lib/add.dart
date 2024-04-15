import 'package:flutter/material.dart';
import 'package:flutter_application_uitest/list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dataAccessHelper.dart';
import 'todo.dart';

///新処理ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
class TodoInputPage extends StatefulWidget {
  /// Todoのモデル
  final Todo? todo;

  /// コンストラクタ
  /// Todoを引数で受け取った場合は更新、受け取らない場合は追加画面となる
  const TodoInputPage({Key? key, this.todo}) : super(key: key);

  /// Todo入力画面の状態を生成する
  @override
  State<TodoInputPage> createState() => _TodoInputPageState();
}

/// Todo入力ト画面の状態クラス
///
/// 以下の責務を持つ
/// ・Todoを追加/更新する
/// ・Todoリスト画面へ戻る
class _TodoInputPageState extends State<TodoInputPage> {
  /// ストア
  final TodoListStore _store = TodoListStore();

  /// 新規追加か
  late bool _isCreateTodo;

  /// 画面項目：タイトル
  late String _name;

  /// 画面項目：詳細
  late String _context;

  /// 画面項目：完了か
  late String _dueDate;

  /// 画面項目：作成日時
  late int _dueFlg;

  /// 画面項目：更新日時
  late int _delFlg;

  /// 初期処理を行う
  @override
  void initState() {
    super.initState();
    var todo = widget.todo;

    _name = todo?.name ?? "";
    _context = todo?.context ?? "";
    _dueDate = todo?.dueDate ?? "";
    _dueFlg = todo?.dueFlg ?? 0;
    _delFlg = todo?.delFlg ?? 0;
    _isCreateTodo = todo == null;
  }

  /// 画面を作成する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // アプリケーションバーに表示するタイトル
        title: Text(_isCreateTodo ? 'Todo追加' : 'Todo更新'),
      ),
      body: Container(
        // 全体のパディング
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            // タイトルのテキストフィールド
            TextField(
              autofocus: true,
              decoration: const InputDecoration(
                labelText: "Title",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              // TextEditingControllerを使用することで、いちいちsetStateしなくても画面を更新してくれる
              controller: TextEditingController(text: _name),
              onChanged: (String value) {
                _name = value;
              },
            ),
            const SizedBox(height: 20),
            // 詳細のテキストフィールド
            TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 3,
              decoration: const InputDecoration(
                labelText: "Context",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
              ),
              // TextEditingControllerを使用することで、いちいちsetStateしなくても画面を更新してくれる
              controller: TextEditingController(text: _context),
              onChanged: (String value) {
                _context = value;
              },
            ),
            const SizedBox(height: 20),
            // 追加/更新ボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _store.add(_name, _context, _dueDate, _dueFlg);
                  // Todoリスト画面に戻る
                  Navigator.of(context).pop();
                },
                child: Text(
                  _isCreateTodo ? 'Add' : '更新',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // キャンセルボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Todoリスト画面に戻る
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  //primary: Colors.white,
                  side: const BorderSide(
                    color: Colors.blue,
                  ),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

///試験処理ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
//追加処理
class AddPageState {
  //DBアクセス
  //final dataAccess dbAcess = dataAccess();

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
