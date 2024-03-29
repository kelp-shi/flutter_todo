import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//PostState
class Post extends StatelessWidget {
  final String name;
  final Color colorPrimary;
  final String DueDate;

  const Post({
    Key? key,
    required this.name,
    required this.colorPrimary,
    required this.DueDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              leading: ClipOval(
                child: Container(
                  color: colorPrimary,
                  width: 45,
                  height: 45,
                  child: Center(
                    child: Text(
                      name.substring(0, 1),
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
              title: Text(name),
              subtitle: Text(DueDate),
            ),
          ],
        ),
      ),
    );
  }
}

//test post data
class _PostGreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Post(
      name: 'Pean',
      colorPrimary: Colors.greenAccent,
      DueDate: '2024-12-31',
    );
  }
}

class _PostRed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Post(
      name: 'Namaga Tema',
      colorPrimary: Colors.deepOrangeAccent,
      DueDate: '2024-12-31',
    );
  }
}
