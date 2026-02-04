import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fultter_web_practice/main.dart';

void main() {
  testWidgets('Counter increment smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SoccerApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await find.byIcon(Icons.add).at(0); // Dummy action
  });
}
