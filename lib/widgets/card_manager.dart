import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pass_manager/model/account.dart';
import 'package:pass_manager/model/account_list.dart';
import 'package:provider/provider.dart';

class CardManager extends StatelessWidget {
  const CardManager({Key? key, required this.account}) : super(key: key);
  final Account account;
  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<AccountList>(context);
    return Card(
      child: InkWell(
        onTap: () {
          print(account.password);
        },
        onLongPress: () {
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(1, 165, 0, 0),
            items: [
              PopupMenuItem(
                height: 40,
                child: Text(
                  'Editar',
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  print('EDITAR');
                },
              ),
              PopupMenuItem(
                height: 40,
                child: Text(
                  'Excluir',
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  accounts.removeAccount(account);
                },
              ),
            ],
          );
        },
        splashColor: Colors.blue.withAlpha(30),
        child: SizedBox(
          height: 80.0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${account.name} (${account.email})',
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
