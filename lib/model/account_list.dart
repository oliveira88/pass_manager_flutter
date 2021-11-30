import 'package:mobx/mobx.dart';
import 'package:pass_manager/model/account.dart';
part 'account_list.g.dart';

class AccountList = _AccountListBase with _$AccountList;

abstract class _AccountListBase with Store {
  @observable
  ObservableList<Account> accounts = ObservableList<Account>();

  @action
  void addAccount(name, password) {
    final account = Account(name, password);
    accounts.add(account);
  }

  @action
  void removeAccount(Account account) {
    accounts.removeWhere((acc) => acc == account);
  }
}
