import 'package:flutter/material.dart';
import 'package:pass_manager/model/account_list.dart';
import 'package:pass_manager/views/home/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const PassManagerApp());
}

class PassManagerApp extends StatelessWidget {
  const PassManagerApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider<AccountList>(
      create: (_) => AccountList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
