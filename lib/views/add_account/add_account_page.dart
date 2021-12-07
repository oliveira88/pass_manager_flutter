import 'package:flutter/material.dart';
import 'package:pass_manager/model/account_list.dart';
import 'package:provider/provider.dart';

class AddPassword extends StatefulWidget {
  const AddPassword({Key? key}) : super(key: key);

  @override
  State<AddPassword> createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = true;
  IconData _passIcon = Icons.visibility_off;

  void _togglePassVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
      _passIcon = _passwordVisible ? Icons.visibility_off : Icons.visibility;
    });
  }

  void _addAccount(BuildContext context, AccountList accounts) {
    var name = _nameController.text;
    var password = _passwordController.text;
    accounts.addAccount(name, password);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<AccountList>(context);
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Adicionar conta'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                autofocus: true,
                style: TextStyle(fontSize: 20.0),
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com algum nome';
                  }
                  return null;
                },
                decoration: InputDecoration(labelText: 'Conta'),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com alguma senha';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Senha',
                  suffixIcon: IconButton(
                    icon: Icon(_passIcon),
                    onPressed: _togglePassVisibility,
                  ),
                ),
                onFieldSubmitted: (_) {
                  if (_formKey.currentState!.validate()) {
                    _addAccount(context, accounts);
                  }
                },
                obscureText: _passwordVisible,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addAccount(context, accounts);
                  }
                },
                child: Text(
                  'Adicionar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
