import 'package:flutter/material.dart';
import 'package:pass_manager/screens/add_password.dart';
import 'package:pass_manager/widgets/card_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciador de Senhas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            CardManager(
              title: 'Teste',
              subtitle: 'senha',
            ),
            CardManager(
              title: 'Facebook',
              subtitle: 'senha',
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPassword()));
        },
      ),
    );
  }
}
