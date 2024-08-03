import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superpoupa_b2b_ui_components/superpoupa_b2b_ui_components.dart';

void main() {
  testWidgets('SuperPoupaB2BEmptyMessage displays icon and label correctly', (WidgetTester tester) async {
    // Define the test parameters
    const testLabel = 'No items available';
    const testIcon = Icons.error;

    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SuperPoupaB2BEmptyMessage(
            label: testLabel,
            icon: testIcon,
          ),
        ),
      ),
    );

    // Verify if the icon is present and displayed correctly
    final iconFinder = find.byIcon(testIcon);
    expect(iconFinder, findsOneWidget);

    // Verify if the text is present and displayed correctly
    final textFinder = find.text(testLabel);
    expect(textFinder, findsOneWidget);

    // Verify the padding and styling
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.style!.color, Colors.grey[300]);
    expect(textWidget.textAlign, TextAlign.center);

    final iconWidget = tester.widget<Icon>(iconFinder);
    expect(iconWidget.size, 100);
    expect(iconWidget.color, Colors.grey[300]);
  });
}
