import 'package:flutter/material.dart';

class AddPassword extends StatelessWidget {
  const AddPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar conta'),
      ),
      backgroundColor: Colors.red,
    );
  }
}
