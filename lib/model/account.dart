import 'package:mobx/mobx.dart';
part 'account.g.dart';

class Account = _AccountBase with _$Account;

abstract class _AccountBase with Store {
  _AccountBase(this.email, this.name, this.password);
  @observable
  String name = '';

  @observable
  String email = '';

  @observable
  String password = '';
}