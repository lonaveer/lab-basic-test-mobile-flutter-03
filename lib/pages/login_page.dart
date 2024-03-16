import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/dashboard_page.dart';
import 'package:my_flutter_app/services/api_service.dart';

void main() {
  runApp(LoginPageApp());
}

class LoginPageApp extends StatelessWidget {
  LoginPageApp ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LoginPage App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(apiService: ApiService()),
    );
  }
}

class LoginPage extends StatefulWidget {
  final ApiService apiService;
  LoginPage({Key? key, required this.apiService}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() async {
    try {
      final token = await widget.apiService.login(
        _usernameController.text,
        _passwordController.text,
      );

      // หาก login สำเร็จ ไปยังหน้า dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage(token: token)),
      );
    } catch (e) {
      // แสดง dialog เมื่อ login ไม่สำเร็จ
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Login failed'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          // ฟิลด์สำหรับกรอก username
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
            key: Key('usernameField'),
          ),
          // ฟิลด์สำหรับกรอก password
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
            key: Key('passwordField'),
          ),
          // ปุ่มสำหรับ login
          ElevatedButton(
            child: Text('Login'),
            onPressed: _login,
            key: Key('loginButton'),
          ),
        ],
      ),
    ));
  }
}