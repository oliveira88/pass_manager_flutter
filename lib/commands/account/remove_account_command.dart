import 'package:pass_manager/commands/base_command.dart';
import 'package:pass_manager/dto/account_dto.dart';

class RemoveAccountCommand extends BaseCommand {
  Future<void> execute(AccountDto acc) async {
    appModel.removeAccount = acc;
  }
}
