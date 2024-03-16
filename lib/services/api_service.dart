class ApiService {
  // ฟังก์ชันสำหรับการ login
  Future<String> login(String username, String password) async {
    // จำลองการเรียกใช้ API login
    // ในโลกจริง คุณจะทำการเรียกใช้ HTTP request ที่นี่
    if (username == 'usertest' && password == 'password123') {
      return Future.value("mockToken"); // ส่งกลับ token จำลอง
    } else {
      throw Exception('Login failed');
    }
  }

  // ฟังก์ชันสำหรับการดึงข้อมูลผู้ใช้
  Future<User> fetchUser(String token) async {
    // จำลองการเรียกใช้ API fetchUser
    // ในโลกจริง คุณจะต้องตรวจสอบ token และทำการเรียกใช้ HTTP request
    if (token == 'mockToken') {
      return Future.value(User(id: '1', name: 'Mock User'));
    } else {
      throw Exception('Token is invalid');
    }
  }
}

// คลาสสำหรับการแสดงข้อมูลผู้ใช้
class User {
  final String id;
  final String name;
  User({required this.id, required this.name});
}