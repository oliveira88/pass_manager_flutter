import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pass_manager/initial_configuration.dart';
import 'package:pass_manager/model/app_model.dart';
import 'package:pass_manager/views/add_account/add_account_page.dart';
import 'package:pass_manager/views/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  initAppConfig();
  runApp(const PassManagerApp());
}

class PassManagerApp extends StatelessWidget {
  const PassManagerApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appModel = GetIt.I.get<AppModel>();
    return ChangeNotifierProvider.value(
      value: appModel,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (c) => const HomePage(),
          '/add-account': (c) => const AddAccountPage()
        },
      ),
    );
  }
}
