import 'package:flutter/material.dart';
import 'package:pass_manager/model/account_list.dart';
import 'package:provider/provider.dart';

class AddPassword extends StatefulWidget {
  const AddPassword({Key? key}) : super(key: key);

  @override
  State<AddPassword> createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  final _emailController = TextEditingController();
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
    String email = _emailController.text;
    String name = _nameController.text;
    String password = _passwordController.text;
    accounts.addAccount(email, name, password);
    Navigator.pop(context);
  }

  String? _validateField(String? value, String text) {
    if (value == null || value.isEmpty) {
      return '$text';
    }
    return null;
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
                controller: _emailController,
                validator: (value) =>
                    _validateField(value, 'Entre com o email'),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                controller: _nameController,
                validator: (value) => _validateField(value, 'Entre com o nome'),
                decoration: InputDecoration(labelText: 'Nome'),
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 24.0),
              TextFormField(
                style: TextStyle(fontSize: 20.0),
                controller: _passwordController,
                validator: (value) =>
                    _validateField(value, 'Entre com a senha'),
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
