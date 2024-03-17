import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/animation_page.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('AnimatedContainer - Animation Test', (WidgetTester tester) async {
    // เรียกฟังก์ชัน main() ของหน้า Animation Page ขึ้นมา , เพื่อโหลด APP ขึ้นมาแสดงผล
    app.main();

    // รอจนกว่า APP จะโหลดขึ้นมาจนเสร็จสิ้น
    await tester.pumpAndSettle();

    // ทำการกดปุ่ม 'Animate Container' , เพื่อเริ่ม animation ของ AnimatedContainer
    await tester.tap(find.text('Animate Container'));

    // เริ่ม animation
    await tester.pump();

    // รอจนกว่า animation จะจบ
    await tester.pumpAndSettle();

    // ตรวจสอบคุณสมบัติ width และ height ของ AnimatedContainer , หลังจาก animation เสร็จสิ้น
    final Finder animatedContainerFinder = find.byType(AnimatedContainer);
    final AnimatedContainer animatedContainer = tester.widget(animatedContainerFinder) as AnimatedContainer;
    expect(animatedContainer.constraints?.maxWidth, equals(200)); // width ของ AnimatedContainer ควรเท่ากับ 200 , หลังจาก animation เสร็จสิ้น
    expect(animatedContainer.constraints?.maxHeight, equals(200)); // height ของ AnimatedContainer ควรเท่ากับ 200 , หลังจาก animation เสร็จสิ้น

    // ตรวจสอบว่า AnimatedContainer เปลี่ยนจาก 'สีนํ้าเงิน' เป็น 'สีแดง' แล้ว , หลังจาก animation เสร็จสิ้น
    expect(find.byWidgetPredicate((Widget widget) => widget is Container &&
      widget.decoration is BoxDecoration &&
      (widget.decoration as BoxDecoration).color == Colors.red),
    findsOneWidget);

    // ทำการกดปุ่ม 'Animate Container' , เพื่อเริ่ม animation ของ AnimatedContainer (อีกรอบ)
    await tester.tap(find.text('Animate Container'));

    // เริ่ม animation
    await tester.pump();

    // รอจนกว่า animation จะจบ
    await tester.pumpAndSettle();

    // ตรวจสอบคุณสมบัติ width และ height ของ AnimatedContainer , หลังจาก animation เสร็จสิ้น
    final AnimatedContainer animatedContainerReverse = tester.widget(animatedContainerFinder) as AnimatedContainer;
    expect(animatedContainerReverse.constraints?.maxWidth, equals(100)); // width ของ AnimatedContainer ควรเท่ากับ 100 , หลังจาก animation เสร็จสิ้น
    expect(animatedContainerReverse.constraints?.maxHeight, equals(100)); // height ของ AnimatedContainer ควรเท่ากับ 100 , หลังจาก animation เสร็จสิ้น

    // ตรวจสอบว่า AnimatedContainer , เปลี่ยนจาก 'สีแดง' เป็น 'สีนํ้าเงิน' แล้ว
    expect(find.byWidgetPredicate((Widget widget) => widget is Container &&
      widget.decoration is BoxDecoration &&
      (widget.decoration as BoxDecoration).color == Colors.blue),
    findsOneWidget);
  });

  testWidgets('AnimatedContainer and AnimatedPositioned - Animation Test', (WidgetTester tester) async {
    // เรียกฟังก์ชัน main() ของหน้า Animation Page ขึ้นมา , เพื่อโหลด APP ขึ้นมาแสดงผล
    app.main();

    // รอจนกว่า APP จะโหลดขึ้นมาจนเสร็จสิ้น
    await tester.pumpAndSettle();

    // ทำการกดปุ่ม 'Animate Position and Switch' , เพื่อเริ่ม animation ของ AnimatedPositioned และ AnimatedSwitcher
    await tester.tap(find.text('Animate Position and Switch'));

    // เริ่ม animation
    await tester.pump();

    // รอจนกว่า animation จะจบ
    await tester.pumpAndSettle();

    // ตรวจสอบตำแหน่งหลังจาก animation
    final Finder animatedPositionedFinder = find.byType(AnimatedPositioned);
    final AnimatedPositioned animatedPositionedAfter = tester.widget(animatedPositionedFinder) as AnimatedPositioned;
    expect(animatedPositionedAfter.left, equals(200)); // ตรวจสอบตำแหน่ง left หลัง animation เสร็จสิ้น

    // ตรวจสอบสีหลังจาก animation
    final Finder containerFinder = find.byWidgetPredicate((Widget widget) => widget is Container && widget.color == Colors.purple);
    expect(containerFinder, findsOneWidget); // ยืนยันว่าพบ Container ที่มีสีม่วง

    // ทำการกดปุ่ม 'Animate Position and Switch' , เพื่อเริ่ม animation ของ AnimatedPositioned และ AnimatedSwitcher (อีกรอบ)
    await tester.tap(find.text('Animate Position and Switch'));

    // เริ่ม animation
    await tester.pump();

    // รอจนกว่า animation จะจบ
    await tester.pumpAndSettle();

    // ตรวจสอบตำแหน่งหลังจาก animation ย้อนกลับ
    final AnimatedPositioned animatedPositionedReverse = tester.widget(animatedPositionedFinder) as AnimatedPositioned;
    expect(animatedPositionedReverse.left, equals(0)); // ยืนยันว่า animation ได้เล่นย้อนกลับไปที่ตำแหน่งเริ่มต้น

    // ตรวจสอบสีหลังจาก animation ย้อนกลับ
    final Finder containerReverseFinder = find.byWidgetPredicate((Widget widget) => widget is Container && widget.color == Colors.green);
    expect(containerReverseFinder, findsOneWidget); // ยืนยันว่าพบ Container ที่มีสีเขียว ซึ่งคือสถานะเริ่มต้นหรือสถานะหลังจาก animation ย้อนกลับ
  });
}