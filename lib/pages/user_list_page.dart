import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(UserListPageApp());
}

class UserListPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<dynamic> _allUsers = [];
  int _currentPage = 0;
  static const int _pageSize = 3;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        _allUsers = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  List<dynamic> _getUsersForCurrentPage() {
    int startIndex = _currentPage * _pageSize;
    int endIndex = startIndex + _pageSize;
    endIndex = endIndex > _allUsers.length ? _allUsers.length : endIndex;
    return _allUsers.sublist(startIndex, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> _usersToShow = _getUsersForCurrentPage();
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: _currentPage > 0
                ? () {
                    setState(() {
                      _currentPage--;
                    });
                  }
                : null,
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: ((_currentPage + 1) * _pageSize < _allUsers.length)
                ? () {
                    setState(() {
                      _currentPage++;
                    });
                  }
                : null,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _usersToShow.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_usersToShow[index]['name']),
            subtitle: Text(_usersToShow[index]['email']),
          );
        },
      ),
    );
  }
}