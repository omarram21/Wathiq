import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wathiq/controllers/choose-two-controller.dart';
import 'package:wathiq/views/navbar/wathiq/choosing/boss/num-cars-location.dart';

void main() {
  // Get.put(RegisterController());
  ChooseTwoControllers chooseTwoControllers = ChooseTwoControllers();
  testWidgets("Test My Widget", (WidgetTester tester) async {
    var text = find.byKey(ValueKey("TextKey"));
    var plusOne = find.byKey(ValueKey("plus"));
    var minusOne = find.byKey(ValueKey("minus"));
    await tester.pumpWidget(MaterialApp(home: NumOfCarsLocation()));

    expect(text, findsOneWidget);
    expect(plusOne, findsOneWidget);
    expect(minusOne, findsOneWidget);

    await tester.tap(plusOne);
    await tester.pump();

    expect(find.text('3'), findsOneWidget);
  });
}
