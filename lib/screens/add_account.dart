import 'package:flutter/material.dart';

class AddPassword extends StatefulWidget {
  const AddPassword({Key? key}) : super(key: key);

  @override
  State<AddPassword> createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _passwordVisible = true;
  IconData _passIcon = Icons.visibility_off;

  void _togglePassVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
      _passIcon = _passwordVisible ? Icons.visibility_off : Icons.visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              autofocus: true,
              style: TextStyle(fontSize: 20.0),
              controller: _accountController,
              decoration: InputDecoration(labelText: 'Conta'),
            ),
            const SizedBox(height: 24.0),
            TextField(
              style: TextStyle(fontSize: 20.0),
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                suffixIcon: IconButton(
                  icon: Icon(_passIcon),
                  onPressed: _togglePassVisibility,
                ),
              ),
              obscureText: _passwordVisible,
            ),
          ],
        ),
      ),
    );
  }
}
