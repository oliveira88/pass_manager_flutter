import 'package:pass_manager/commands/base_command.dart';
import 'package:pass_manager/dto/account_dto.dart';

class GetAccountsCommand with BaseCommand {
  Future<List<AccountDto>> execute() async {
    // await Future.delayed(const Duration(seconds: 12));
    return appModel.accountList;
  }
}
