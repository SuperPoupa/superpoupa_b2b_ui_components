import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superpoupa_b2b_ui_components/superpoupa_b2b_ui_components.dart';

void main() {
  testWidgets('SuperPoupaB2BButton renders correctly', (WidgetTester tester) async {
    // Create the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuperPoupaB2BButton(
            label: 'Click here',
            width: 200,
            onClick: () {},
          ),
        ),
      ),
    );

    // Verify that the ElevatedButton exists
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verify that the text is correct
    expect(find.text('Click here'), findsOneWidget);

    // Verify that the default background color is orange
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect((button.style?.backgroundColor?.resolve({})), Colors.orange);

    // Verify that the maximum width is correct
    expect((button.style?.maximumSize?.resolve({}))?.width, 200);
  });

  testWidgets('SuperPoupaB2BButton renders secondary variant', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuperPoupaB2BButton(
            label: 'Click here',
            width: 200,
            onClick: () {},
            variant: 'secondary',
            color: Colors.blue,
          ),
        ),
      ),
    );

    // Verify that the background color is white for the secondary variant
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect((button.style?.backgroundColor?.resolve({})), Colors.white);

    // Verify that the text color is blue for the secondary variant
    final text = tester.widget<Text>(find.text('Click here'));
    expect(text.style?.color, Colors.blue);

    // Verify that the border is blue
    expect((button.style?.shape?.resolve({}))?.side.color, Colors.blue);
  });

  testWidgets('SuperPoupaB2BButton renders loading state', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuperPoupaB2BButton(
            label: 'Click here',
            width: 200,
            onClick: () {},
            isLoading: true,
          ),
        ),
      ),
    );

    // Verify that the CircularProgressIndicator is present
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Verify that the text is not present
    expect(find.text('Click here'), findsNothing);
  });
}
