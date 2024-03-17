import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_flutter_app/pages/animation_page.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // testWidgets('AnimatedContainer - Animation Test', (WidgetTester tester) async {
  //   // เรียกฟังก์ชัน main() ของหน้า Animation Page ขึ้นมา , เพื่อโหลด APP ขึ้นมาแสดงผล
  //   app.main();

  //   // รอจนกว่า APP จะโหลดขึ้นมาจนเสร็จสิ้น
  //   await tester.pumpAndSettle();

  //   // ทำการกดปุ่ม 'Animate Container' , เพื่อเริ่ม animation ของ AnimatedContainer
  //   xxxxx____1.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // เริ่ม animation
  //   await tester.pump();

  //   // รอจนกว่า animation จะจบ
  //   await tester.pumpAndSettle();

  //   // ตรวจสอบคุณสมบัติ width และ height ของ AnimatedContainer , หลังจาก animation เสร็จสิ้น
  //   final Finder animatedContainerFinder = find.byType(AnimatedContainer);
  //   final AnimatedContainer animatedContainer = tester.widget(animatedContainerFinder) as AnimatedContainer;
  //   expect(animatedContainer.constraints?.maxWidth, equals(200)); // width ของ AnimatedContainer ควรเท่ากับ 200 , หลังจาก animation เสร็จสิ้น
  //   expect(animatedContainer.constraints?.maxHeight, xxxxx____2.จงเติมคำตอบที่ถูกต้อง_____xxxxx); // height ของ AnimatedContainer ควรเท่ากับ 200 , หลังจาก animation เสร็จสิ้น

  //   // ตรวจสอบว่า AnimatedContainer เปลี่ยนจาก 'สีนํ้าเงิน' เป็น 'สีแดง' แล้ว , หลังจาก animation เสร็จสิ้น
  //   expect(find.byWidgetPredicate((Widget widget) => widget is Container &&
  //     widget.decoration is BoxDecoration &&
  //     (widget.decoration as BoxDecoration).color == Colors.red),
  //   findsOneWidget);

  //   // ทำการกดปุ่ม 'Animate Container' , เพื่อเริ่ม animation ของ AnimatedContainer (อีกรอบ)
  //   xxxxx____3.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // เริ่ม animation
  //   xxxxx____4.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // รอจนกว่า animation จะจบ
  //   xxxxx____5.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // ตรวจสอบคุณสมบัติ width และ height ของ AnimatedContainer , หลังจาก animation เสร็จสิ้น
  //   final AnimatedContainer animatedContainerReverse = tester.widget(animatedContainerFinder) as AnimatedContainer;
  //   expect(xxxxx____6.จงเติมคำตอบที่ถูกต้อง_____xxxxx); // width ของ AnimatedContainer ควรเท่ากับ 100 , หลังจาก animation เสร็จสิ้น
  //   expect(xxxxx____7.จงเติมคำตอบที่ถูกต้อง_____xxxxx); // height ของ AnimatedContainer ควรเท่ากับ 100 , หลังจาก animation เสร็จสิ้น

  //   // ตรวจสอบว่า AnimatedContainer , เปลี่ยนจาก 'สีแดง' เป็น 'สีนํ้าเงิน' แล้ว
  //   xxxxx____8.จงเติมคำตอบที่ถูกต้อง_____xxxxx
  // });

  // testWidgets('AnimatedContainer and AnimatedPositioned - Animation Test', (WidgetTester tester) async {
  //   // เรียกฟังก์ชัน main() ของหน้า Animation Page ขึ้นมา , เพื่อโหลด APP ขึ้นมาแสดงผล
  //   xxxxx____9.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // รอจนกว่า APP จะโหลดขึ้นมาจนเสร็จสิ้น
  //   xxxxx____10.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // ทำการกดปุ่ม 'Animate Position and Switch' , เพื่อเริ่ม animation ของ AnimatedPositioned และ AnimatedSwitcher
  //   xxxxx____11.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // เริ่ม animation
  //   xxxxx____12.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // รอจนกว่า animation จะจบ
  //   xxxxx____13.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // ตรวจสอบตำแหน่งหลังจาก animation
  //   final Finder animatedPositionedFinder = find.byType(AnimatedPositioned);
  //   final AnimatedPositioned animatedPositionedAfter = tester.widget(animatedPositionedFinder) as AnimatedPositioned;
  //   expect(xxxxx____14.จงเติมคำตอบที่ถูกต้อง_____xxxxx); // ตรวจสอบตำแหน่ง left หลัง animation เสร็จสิ้น

  //   // ตรวจสอบสีหลังจาก animation
  //   final Finder containerFinder = find.byWidgetPredicate((Widget widget) => widget is Container && widget.color == Colors.purple);
  //   expect(containerFinder, findsOneWidget); // ยืนยันว่าพบ Container ที่มีสีม่วง

  //   // ทำการกดปุ่ม 'Animate Position and Switch' , เพื่อเริ่ม animation ของ AnimatedPositioned และ AnimatedSwitcher (อีกรอบ)
  //   xxxxx____15.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // เริ่ม animation
  //   xxxxx____16.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // รอจนกว่า animation จะจบ
  //   xxxxx____17.จงเติมคำตอบที่ถูกต้อง_____xxxxx

  //   // ตรวจสอบตำแหน่งหลังจาก animation ย้อนกลับ
  //   final AnimatedPositioned animatedPositionedReverse = tester.widget(animatedPositionedFinder) as AnimatedPositioned;
  //   expect(xxxxx____18.จงเติมคำตอบที่ถูกต้อง_____xxxxx); // ยืนยันว่า animation ได้เล่นย้อนกลับไปที่ตำแหน่งเริ่มต้น (0)

  //   // ตรวจสอบสีหลังจาก animation ย้อนกลับ
  //   final Finder containerReverseFinder = find.byWidgetPredicate(xxxxx____19.จงเติมคำตอบที่ถูกต้อง_____xxxxx);
  //   expect(xxxxx____20.จงเติมคำตอบที่ถูกต้อง_____xxxxx); // ยืนยันว่าพบ Container ที่มีสีเขียว ซึ่งคือสถานะเริ่มต้นหรือสถานะหลังจาก animation ย้อนกลับ
  // });
}