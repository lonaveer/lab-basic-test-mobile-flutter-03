import 'package:flutter/material.dart';
import 'package:my_flutter_app/services/api_service.dart';

class DashboardPage extends StatefulWidget {
  final String token;
  DashboardPage({Key? key, required this.token}) : super(key: key);
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late Future<User> _userFuture;

  @override
  void initState() {
    super.initState();
    // ดึงข้อมูลผู้ใช้โดยใช้ token
    _userFuture = ApiService().fetchUser(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: FutureBuilder<User>(
      future: _userFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Center(
              child: Text("Welcome, ${snapshot.data!.name}!"),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error fetching user data"),
            );
          }
        }
        // แสดง CircularProgressIndicator ในระหว่างที่ข้อมูลกำลังถูกโหลด
        return Center(child: CircularProgressIndicator());
      },
    ));
  }
}