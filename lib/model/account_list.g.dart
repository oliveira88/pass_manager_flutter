// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountList on _AccountListBase, Store {
  final _$accountsAtom = Atom(name: '_AccountListBase.accounts');

  @override
  ObservableList<Account> get accounts {
    _$accountsAtom.reportRead();
    return super.accounts;
  }

  @override
  set accounts(ObservableList<Account> value) {
    _$accountsAtom.reportWrite(value, super.accounts, () {
      super.accounts = value;
    });
  }

  final _$_AccountListBaseActionController =
      ActionController(name: '_AccountListBase');

  @override
  void addAccount(dynamic name, dynamic password) {
    final _$actionInfo = _$_AccountListBaseActionController.startAction(
        name: '_AccountListBase.addAccount');
    try {
      return super.addAccount(name, password);
    } finally {
      _$_AccountListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAccount(Account account) {
    final _$actionInfo = _$_AccountListBaseActionController.startAction(
        name: '_AccountListBase.removeAccount');
    try {
      return super.removeAccount(account);
    } finally {
      _$_AccountListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accounts: ${accounts}
    ''';
  }
}
