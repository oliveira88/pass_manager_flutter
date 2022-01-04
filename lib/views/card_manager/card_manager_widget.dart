import 'package:flutter/material.dart';
import 'package:pass_manager/commands/account/remove_account_command.dart';
import 'package:pass_manager/dto/account_dto.dart';

class CardManager extends StatelessWidget {
  const CardManager({Key? key, required this.account}) : super(key: key);
  final AccountDto account;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          debugPrint(account.password);
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
                  debugPrint('EDITAR');
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
                  RemoveAccountCommand().execute(account);
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
