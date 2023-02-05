import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wathiq/views/authentication/SignIn/sign-in.dart';

void main() {
  testWidgets("Sign-in Test", (WidgetTester tester) async {
    var nationalNumber = find.byKey(ValueKey("National-number"));
    var password = find.byKey(ValueKey("Password"));
    var signIn = find.byKey(ValueKey("SignIn"));

    await tester.pumpWidget(MaterialApp(home: SignIn()));

    expect(nationalNumber, findsOneWidget);
    expect(password, findsOneWidget);
    expect(signIn, findsOneWidget);
  });
}
