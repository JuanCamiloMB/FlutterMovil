import 'package:flutter/material.dart';
import 'package:myapp/auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text, password: _controllerPassword.text);
  }

    Widget _title() {
    return const Text('Firebase Auth');
  }

    Widget _entryField(String title, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: title),
    );
  }

  Widget _submitButton(context) {
    return ElevatedButton(
        onPressed: () async {
          try{
            await signInWithEmailAndPassword();
            Navigator.pushReplacementNamed(context, '/home');
          }catch(e){
            print('Login failed: $e');
          }
        },
        child: const Text('Login'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email', _controllerEmail),
            _entryField('password', _controllerPassword),
            // _errorMessage(),
            _submitButton(context),
            // _loginOrRegisterButton()
          ],
        ),
      ),
    );
  }
}