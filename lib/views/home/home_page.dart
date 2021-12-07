import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pass_manager/model/account_list.dart';
import 'package:pass_manager/views/add_account/add_account_page.dart';
import 'package:pass_manager/views/card_manager/card_manager_widget.dart';
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
            child: accounts.accounts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.people,
                          color: Colors.black54,
                          size: 80.0,
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Nenhuma conta adicionada!',
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: accounts.accounts.length,
                    itemBuilder: (_, index) {
                      final account = accounts.accounts[index];
                      return CardManager(account: account);
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
