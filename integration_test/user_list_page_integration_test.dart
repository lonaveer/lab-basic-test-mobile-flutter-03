import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/user_list_page.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('User List Page Pagination Tests', () {
    testWidgets('Initial load should show first 3 users', (WidgetTester tester) async {
      // เรียกฟังก์ชัน main() ของหน้า User List Page ขึ้นมา , เพื่อโหลด APP ขึ้นมาแสดงผล
      app.main();

      // รอจนกว่า APP จะโหลดขึ้นมาจนเสร็จสิ้น
      await tester.pumpAndSettle();

      // รอจนกว่า API จะโหลดเสร็จสิ้น
      final DateTime endTime = DateTime.now().add(Duration(seconds: 10));
      while (DateTime.now().isBefore(endTime)) {
        await tester.pump(Duration(seconds: 1));
        if (find.textContaining('Leanne Graham').evaluate().isNotEmpty) {
          break; // หากพบข้อมูลที่คาดหวัง , ออกจากลูป
        }
      };

      // ตรวจสอบผลลัพธ์ : User List หน้าแรก ต้องมีข้อมูลทั้งหมด 3 รายการ
      expect(find.byType(ListTile), findsNWidgets(3));
    });

    testWidgets('Navigate to next page should show next 3 users', (WidgetTester tester) async {
      // เรียกฟังก์ชัน main() ของหน้า User List Page ขึ้นมา , เพื่อโหลด APP ขึ้นมาแสดงผล
      app.main();

      // รอจนกว่า APP จะโหลดขึ้นมาจนเสร็จสิ้น
      await tester.pumpAndSettle();

      // รอจนกว่า API จะโหลดเสร็จสิ้น
      final DateTime endTime = DateTime.now().add(Duration(seconds: 10));
      while (DateTime.now().isBefore(endTime)) {
        await tester.pump(Duration(seconds: 1));
        if (find.textContaining('Leanne Graham').evaluate().isNotEmpty) {
          break; // หากพบข้อมูลที่คาดหวัง , ออกจากลูป
        }
      };

      // กดปุ่ม Next เพื่อดูข้อมูล User List หน้าถัดไป
      await tester.tap(find.byIcon(Icons.navigate_next));

      // รอ Animation เปลี่ยน User List เป็นหน้าถัดไป
      await tester.pumpAndSettle();

      // ตรวจสอบผลลัพธ์ : User List หน้าถัดไป ต้องมีข้อมูลทั้งหมด 3 รายการ
      expect(find.byType(ListTile), findsNWidgets(3));
    });

    testWidgets('Navigate to previous page after next page should show previous 3 users', (WidgetTester tester) async {
      // เรียกฟังก์ชัน main() ของหน้า User List Page ขึ้นมา , เพื่อโหลด APP ขึ้นมาแสดงผล
      app.main();

      // รอจนกว่า APP จะโหลดขึ้นมาจนเสร็จสิ้น
      await tester.pumpAndSettle();

      // รอจนกว่า API จะโหลดเสร็จสิ้น
      final DateTime endTime = DateTime.now().add(Duration(seconds: 10));
      while (DateTime.now().isBefore(endTime)) {
        await tester.pump(Duration(seconds: 1));
        if (find.textContaining('Leanne Graham').evaluate().isNotEmpty) {
          break; // หากพบข้อมูลที่คาดหวัง , ออกจากลูป
        }
      };

      // กดปุ่ม Next เพื่อดูข้อมูล User List หน้าถัดไป
      await tester.tap(find.byIcon(Icons.navigate_next));

      // รอ Animation เปลี่ยน User List เป็นหน้าถัดไป
      await tester.pumpAndSettle();

      // ตรวจสอบผลลัพธ์ : User List หน้าถัดไป ต้องมีข้อมูลทั้งหมด 3 รายการ
      expect(find.byType(ListTile), findsNWidgets(3));

      // กดปุ่ม Before เพื่อดูข้อมูล User List หน้าก่อนหน้า
      await tester.tap(find.byIcon(Icons.navigate_before));

      // รอ Animation เปลี่ยน User List เป็นหน้าก่อนหน้า
      await tester.pumpAndSettle();

      // ตรวจสอบผลลัพธ์ : User List หน้าก่อนหน้า ต้องมีข้อมูลทั้งหมด 3 รายการ
      expect(find.byType(ListTile), findsNWidgets(3));
    });

    testWidgets('Navigate to last page should disable next page button', (WidgetTester tester) async {
      // เรียกฟังก์ชัน main() ของหน้า User List Page ขึ้นมา , เพื่อโหลด APP ขึ้นมาแสดงผล
      app.main();

      // รอจนกว่า APP จะโหลดขึ้นมาจนเสร็จสิ้น
      await tester.pumpAndSettle();

      // รอจนกว่า API จะโหลดเสร็จสิ้น
      final DateTime endTime = DateTime.now().add(Duration(seconds: 10));
      while (DateTime.now().isBefore(endTime)) {
        await tester.pump(Duration(seconds: 1));
        if (find.textContaining('Leanne Graham').evaluate().isNotEmpty) {
          break; // หากพบข้อมูลที่คาดหวัง , ออกจากลูป
        }
      };

      // ค้นหา IconButton ของปุ่มหน้าถัดไป
      final Finder nextIconButtonFinder = find.widgetWithIcon(IconButton, Icons.navigate_next);

      // กดปุ่มหน้าถัดไปจนไม่สามารถกดได้อีก (หมายถึงถึงหน้าสุดท้าย)
      while (tester.widget<IconButton>(nextIconButtonFinder).onPressed != null) {
        await tester.tap(nextIconButtonFinder);
        await tester.pumpAndSettle();
      }

      // หลังจากที่ถึงหน้าสุดท้าย, ตรวจสอบว่าปุ่มหน้าถัดไปถูก disable
      final IconButton nextIconButton = tester.widget<IconButton>(nextIconButtonFinder);
      expect(nextIconButton.onPressed, isNull);

      // ตรวจสอบผลลัพธ์ : User List หน้าสุดท้าย ต้องมีข้อมูล <= 3 รายการ
      final numberOfListTiles = tester.widgetList(find.byType(ListTile)).length;
      expect(numberOfListTiles <= 3, isTrue);
    });
  });
}