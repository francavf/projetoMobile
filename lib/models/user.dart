import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  static User usuario = User('', -2, '', '', '', '', '');
  final int id;
  final String nome;
  final String email;
  final String created_at;
  final String updated_at;
  final String token;
  final email_verified_at;

  User(this.email_verified_at, this.id, this.nome, this.email, this.created_at,
      this.updated_at, this.token);

  static Future<int> fetch(String login, String senha) async {
    var url = "http://192.168.1.20:8000/api/login?email=$login&password=$senha";
    var response = await http.post(Uri.parse(url));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body);
      var teste2 = jsonEncode(json['user']);
      var json2 = jsonDecode(teste2);
      User.usuario = User(
          json2['email_verified_at'],
          json2['id'],
          json2['name'],
          json2['email'],
          json2['created_at'],
          json2['updated_at'],
          json['token']);
    }
    return response.statusCode;
  }

  static Future<int> Logout(String token) async {
    var url = "http://192.168.1.20:8000/api/logout";
    var response = await http.post(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    });

    return response.statusCode;
  }
}
