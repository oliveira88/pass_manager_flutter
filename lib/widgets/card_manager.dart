import 'package:flutter/material.dart';

class CardManager extends StatelessWidget {
  const CardManager({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 20.0),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
