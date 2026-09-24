// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:marcador/main.dart';

void main() {
  testWidgets('Marcador smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Both teams start at 0 and it's a tie.
    expect(find.text('0'), findsNWidgets(2));
    expect(find.text('Empate'), findsOneWidget);

    // Team 1 scores.
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('No hay empate'), findsOneWidget);

    // Team 2 scores, tie again.
    await tester.tap(find.byIcon(Icons.add).last);
    await tester.pump();

    expect(find.text('1'), findsNWidgets(2));
    expect(find.text('Empate'), findsOneWidget);

    // Team 1 goes back to 0.
    await tester.tap(find.byIcon(Icons.remove).first);
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('No hay empate'), findsOneWidget);
  });
}
