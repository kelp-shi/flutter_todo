import 'package:flutter/material.dart';
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
  //late String _context;

  /// 画面項目：期日
  late String _dueDate;

  /// 画面項目：期日フラグ
  late int _dueFlg;

  /// 初期処理を行う
  @override
  void initState() {
    super.initState();
    var todo = widget.todo;

    _name = todo?.name ?? "";
    //_context = todo?.context ?? "";
    _dueDate = todo?.dueDate ?? "";
    _dueFlg = todo?.dueFlg ?? 0;
    _isCreateTodo = todo == null;
  }

  int tagColorNum = 0;
  //bool isSelected = false;
  int isSelected = 0;

  /// 画面を作成する
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // アプリケーションバーに表示するタイトル
        title: Text(_isCreateTodo ? 'Todo追加' : 'Todo更新'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: ListView(
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

            //-----------------------------------------
            Container(
                padding: const EdgeInsets.only(top: 10),
                //枠線・テキストラベル設定
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: "Tag color",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  //タグカラー
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // グレー
                      GestureDetector(
                        onTap: () {
                          tagColorNum = 0;
                          isSelected = 0;
                          setState(() {});
                          debugPrint(
                              'select colorNumber : $tagColorNum selectFlg : $isSelected ');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              border: Border.all(
                                color: isSelected == 0
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 3,
                              )),
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                        ),
                      ),
                      // 赤
                      GestureDetector(
                        onTap: () {
                          tagColorNum = 1;
                          isSelected = 1;
                          setState(() {});
                          debugPrint(
                              'select colorNumber : $tagColorNum selectFlg : $isSelected ');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                            border: Border.all(
                              color: isSelected == 1
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                        ),
                      ),
                      // オレンジ
                      GestureDetector(
                        onTap: () {
                          tagColorNum = 2;
                          isSelected = 2;
                          setState(() {});
                          debugPrint(
                              'select colorNumber : $tagColorNum selectFlg : $isSelected ');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange,
                              border: Border.all(
                                color: isSelected == 2
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 3,
                              )),
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                        ),
                      ),
                      // みどり
                      GestureDetector(
                        onTap: () {
                          tagColorNum = 3;
                          isSelected = 3;
                          setState(() {});
                          debugPrint(
                              'select colorNumber : $tagColorNum selectFlg : $isSelected ');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                              border: Border.all(
                                color: isSelected == 3
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 3,
                              )),
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                        ),
                      ),
                      // 青
                      GestureDetector(
                        onTap: () {
                          tagColorNum = 4;
                          isSelected = 4;
                          setState(() {});
                          debugPrint(
                              'select colorNumber : $tagColorNum selectFlg : $isSelected ');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                              border: Border.all(
                                color: isSelected == 4
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 3,
                              )),
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                        ),
                      ),
                      // 紫

                      GestureDetector(
                        onTap: () {
                          tagColorNum = 5;
                          isSelected = 5;
                          setState(() {});
                          debugPrint(
                              'select colorNumber : $tagColorNum selectFlg : $isSelected ');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurple,
                              border: Border.all(
                                color: isSelected == 5
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 3,
                              )),
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                        ),
                      ),
                      // 黒
                      GestureDetector(
                        onTap: () {
                          tagColorNum = 6;
                          isSelected = 6;
                          setState(() {});
                          debugPrint(
                              'select colorNumber : $tagColorNum selectFlg : $isSelected ');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              border: Border.all(
                                color: isSelected == 6
                                    ? Colors.blue
                                    : Colors.transparent,
                                width: 3,
                              )),
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 20),
            // 追加/更新ボタン
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _store.add(_name, _dueDate, _dueFlg, tagColorNum);
                  // Todoリスト画面に戻る
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
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
