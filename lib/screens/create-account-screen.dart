import 'package:flutter/material.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _Create_AccountState();
}

class _Create_AccountState extends State<CreateAccount> {
  @override
  String name = '', password = '', repassword = '', email = '';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Criar conta")),
        body: SizedBox(
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
                    name = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'name',
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
                    email = text;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email',
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
                    labelText: 'password  ',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(5),
                height: 50,
                width: 300,
                child: TextField(
                  onChanged: (text) {
                    repassword = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'password_confirmation',
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  var response = await http.post(Uri.parse(
                      "http://192.168.1.20:8000/api/register?name=$name&email=$email&password=$password&password_confirmation=$repassword"));
                  print(response.statusCode);
                  if (response.statusCode >= 200 && response.statusCode < 300) {
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Criar'),
              ),
            ],
          ),
        ));
  }
}
