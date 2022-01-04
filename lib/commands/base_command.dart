import 'package:get_it/get_it.dart';
import 'package:pass_manager/model/app_model.dart';

class BaseCommand {
  AppModel appModel = GetIt.I.get<AppModel>();
}
