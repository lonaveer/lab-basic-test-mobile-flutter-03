import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/product_page.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Product List Integration Test', () {
    testWidgets('Test if products are loaded and displayed', (WidgetTester tester) async {
      // เรียกฟังก์ชัน main ของหน้า Login เพื่อโหลดแอปพลิเคชันขึ้นมาแสดงผล
      app.main();

      // รอให้แอปพลิเคชันเริ่มต้น
      await tester.pumpAndSettle();

      // รอจนกว่า API จะโหลดเสร็จสิ้น
      final DateTime endTime = DateTime.now().add(Duration(seconds: 10));
      while (DateTime.now().isBefore(endTime)) {
        await tester.pump(Duration(seconds: 1));
        if (find.textContaining('Leanne Graham').evaluate().isNotEmpty) {
          break; // หากพบข้อมูลที่คาดหวัง , ออกจากลูป
        } else {
          // ตรวจสอบว่า CircularProgressIndicator ถูกแสดงขณะโหลดข้อมูล
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        }
      };

      // ตรวจสอบว่า CircularProgressIndicator หายไปหลังจากโหลดข้อมูลเสร็จสิ้น
      expect(find.byType(CircularProgressIndicator), findsNothing);

      // ตรวจสอบว่ามี ListTile ถูกแสดงบนหน้าจอซึ่งหมายความว่าข้อมูลถูกโหลดและแสดงผลเรียบร้อย
      expect(find.byType(ListTile), findsWidgets);
    });
  });
}