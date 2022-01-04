import 'package:flutter/material.dart';
import 'package:pass_manager/dto/account_dto.dart';

class AppModel with ChangeNotifier {
  List<AccountDto> _accountList = [];
  List<AccountDto> get accountList => _accountList;

  set account(AccountDto acc) {
    _accountList = [..._accountList, acc];
    notifyListeners();
  }

  set removeAccount(AccountDto account) {
    _accountList = List.from(_accountList)
      ..removeWhere((acc) => account.id == acc.id);
    notifyListeners();
  }
}
