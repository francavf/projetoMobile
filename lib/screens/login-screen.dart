import 'package:flutter/material.dart';
import '../utils/routes.dart';
import '../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            height: 50,
            width: 300,
            child: TextField(
              onChanged: (text) {
                email = text;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 50,
            width: 300,
            child: TextField(
              onChanged: (text) {
                password = text;
              },
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.CREATE_ACCOUNT);
              },
              child: Text("Create Account")),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () async {
              int status = await User.fetch(email, password);
              if (status >= 200 && status < 300) {
                Navigator.of(context).pushReplacementNamed(Routes.HOME_DEVICES);
              } else {}
            },
            child: Text('Entrar'),
          ),
        ],
      ),
    ));
  }
}
