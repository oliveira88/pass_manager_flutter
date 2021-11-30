import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pass_manager/model/account_list.dart';
import 'package:pass_manager/screens/add_account.dart';
import 'package:pass_manager/widgets/card_manager.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<AccountList>(context);
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Gerenciador de Senhas'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: accounts.accounts.length,
              itemBuilder: (_, index) {
                final account = accounts.accounts[index];
                return CardManager(title: account.name);
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddPassword()),
              );
            },
          ),
        );
      },
    );
  }
}
