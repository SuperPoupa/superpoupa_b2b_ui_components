import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superpoupa_b2b_ui_components/src/superpoupa_b2b_dropdown.dart';

void main() {
  testWidgets('SuperPoupaB2BDropdown test', (WidgetTester tester) async {
    // Define test data
    const labelText = 'Test Label';
    const values = ['Value 1', 'Value 2', 'Value 3'];
    const selectedValue = 'Value 2';
    var selectedValueCallback = '';

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SuperPoupaB2BDropdown(
          labelText: labelText,
          values: values,
          selectedValue: selectedValue,
          onSelect: (value) => selectedValueCallback = value!,
        ),
      ),
    ));

    // Verify that the widget is displayed
    expect(find.byType(SuperPoupaB2BDropdown), findsOneWidget);
    expect(find.byType(DropdownButton<String>), findsOneWidget);

    // Verify the properties are set correctly
    final dropdown =
        tester.widget<DropdownButton<String>>(find.byType(DropdownButton<String>));
    expect(dropdown.value, selectedValue);
    expect(dropdown.isDense, true);
    expect(dropdown.items?.length, values.length);

    // Verify the decoration properties
    final inputDecorator = tester.widget<InputDecorator>(find.byType(InputDecorator));
    final decoration = inputDecorator.decoration;
    expect(decoration.labelText, labelText);
    expect(decoration.border, isA<OutlineInputBorder>());

    // Verify the SizedBox properties
    final sizedbox = tester.widget<SizedBox>(find.byType(SizedBox).first);
    expect(sizedbox.height, 60); // Default height for non-xlarge screens

    // Test onSelect callback
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Value 3').last);
    await tester.pumpAndSettle();
    expect(selectedValueCallback, 'Value 3');
  });
}
