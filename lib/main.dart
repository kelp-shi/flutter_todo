import 'package:flutter/material.dart';
//import 'side.dart';
import 'list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext contexrt) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter UI Demo',
      theme: ThemeData.light(),
      home: AdminMobilePage(),
    );
  }
}

class AdminMobilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //未実装サイドナビ
          //SideNavi(),
          VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(child: PostList()),
        ],
      ),
    );
  }
}
