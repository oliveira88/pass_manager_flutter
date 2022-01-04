import 'package:flutter/material.dart';
import 'package:pass_manager/commands/account/get_accounts_command.dart';
import 'package:pass_manager/dto/account_dto.dart';
import 'package:pass_manager/views/card_manager/card_manager_widget.dart';
import 'package:provider/provider.dart';

import '../../model/app_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var accountList =
        context.select<AppModel, List<AccountDto>>((a) => a.accountList);
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciador de Senhas'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: accountList.isEmpty ? EmptyState() : AccountsList()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add-account');
        },
      ),
    );
  }
}

class AccountsList extends StatelessWidget {
  const AccountsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AccountDto>>(
      future: GetAccountsCommand().execute(),
      builder: (context, snapshot) {
        return Stack(
          children: [
            ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (_, index) {
                final account = snapshot.data?[index];
                return account != null
                    ? CardManager(account: account)
                    : Container();
              },
            ),
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Container(),
          ],
        );
      },
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
            style: TextStyle(fontSize: 18.0, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
