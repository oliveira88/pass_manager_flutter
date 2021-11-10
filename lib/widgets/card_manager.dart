import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardManager extends StatelessWidget {
  const CardManager({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        splashColor: Colors.blue.withAlpha(30),
        child: SizedBox(
          height: 80.0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
