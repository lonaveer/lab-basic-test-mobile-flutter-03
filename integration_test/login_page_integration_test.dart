import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/login_page.dart' as app;
import 'package:my_flutter_app/pages/dashboard_page.dart';
import 'package:my_flutter_app/services/api_service.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login and Dashboard Integration Tests', () {
    testWidgets('Login Success and Fetch User Data', (WidgetTester tester) async {
      // เรียกฟังก์ชัน main ของหน้า Login เพื่อโหลดแอปพลิเคชันขึ้นมาแสดงผล
      app.main();

      // รอให้แอปพลิเคชันเริ่มต้น
      await tester.pumpAndSettle();

      // กรอกข้อมูล 'usertest' ลงใน TextField 'usernameField'
      await tester.enterText(find.byKey(Key('usernameField')), 'usertest');

      // กรอกข้อมูล 'password123' ลงใน TextField 'passwordField'
      await tester.enterText(find.byKey(Key('passwordField')), 'password123');

      // กดปุ่ม login
      await tester.tap(find.byKey(Key('loginButton')));

      // รอการเปลี่ยนหน้า
      await tester.pumpAndSettle();

      // ตรวจสอบว่าหน้า Dashboard ถูกแสดงพร้อมข้อมูลผู้ใช้
      expect(find.text('Welcome, Mock User!'), findsOneWidget);
    });

    testWidgets('Login Failure Display Alert', (WidgetTester tester) async {
      // เรียกฟังก์ชัน main ของหน้า Login เพื่อโหลดแอปพลิเคชันขึ้นมาแสดงผล
      app.main();

      // รอให้แอปพลิเคชันเริ่มต้น
      await tester.pumpAndSettle();

      // กรอกข้อมูล 'wrongUser' ลงใน TextField 'usernameField'
      await tester.enterText(find.byKey(Key('usernameField')), 'wrongUser');

      // กรอกข้อมูล 'wrongPassword' ลงใน TextField 'passwordField'
      await tester.enterText(find.byKey(Key('passwordField')), 'wrongPassword');

      // กดปุ่ม login
      await tester.tap(find.byKey(Key('loginButton')));

      // ไม่ต้องรอการเปลี่ยนหน้า เพราะจะแสดงแค่ dialog error , จึงสามารถใช้แค่ pump แทน pumpAndSettle ได้
      await tester.pump();

      // ตรวจสอบว่ามีการแสดงข้อความ error 'Login failed'
      expect(find.text('Login failed'), findsOneWidget);
    });
  });
}