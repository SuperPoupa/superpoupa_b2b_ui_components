
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'package:superpoupa_b2b_ui_components/superpoupa_b2b_ui_components.dart';

void main() {
  testWidgets('SuperPoupaB2BTextField test', (WidgetTester tester) async {
    // Define test data
    const label = 'Test Label';
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController();
    const keyboardType = TextInputType.text;
    const obscureText = false;
    const autoFocus = false;
    const enabled = true;
    final inputFormatters = <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
    const width = 200.0;
    const height = 50.0;
    const suffixIcon = Icon(Icons.search);
    const validate = true;

    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            children: [
              SuperPoupaB2BTextField(
                label: label,
                controller: controller,
                keyboardType: keyboardType,
                obscureText: obscureText,
                autoFocus: autoFocus,
                enabled: enabled,
                inputFormatters: inputFormatters,
                width: width,
                height: height,
                suffixIcon: suffixIcon,
                validate: validate,
              ),
            ],
          ),
        ),
      ),
    ));

    // Verify that the widget is displayed
    expect(find.byType(SuperPoupaB2BTextField), findsOneWidget);
    expect(find.byType(TextFormField), findsOneWidget);

    // Verify the properties are set correctly
    final textFormField = tester.widget<TextField>(find.byType(TextField));
    expect(textFormField.controller, controller);
    expect(textFormField.keyboardType, keyboardType);
    expect(textFormField.obscureText, obscureText);
    expect(textFormField.enabled, enabled);
    expect(textFormField.inputFormatters, inputFormatters);

    // Verify the decoration properties
    final decoration = textFormField.decoration as InputDecoration;
    expect(decoration.label, isA<Text>());
    expect((decoration.label as Text).data, label);
    expect(decoration.suffixIcon, suffixIcon);
    expect(decoration.border, isA<OutlineInputBorder>());

    // Verify the SizedBox properties
    final sizedbox = tester.widget<SizedBox>(find.byType(SizedBox).first);
    expect(sizedbox.width, width);
    expect(sizedbox.height, height);

    // Test the validator
    textFormField.controller!.text = '';
    formKey.currentState!.validate();
    await tester.pump();
    expect(formKey.currentState!.validate(), false);
    expect(find.text('Campo obrigatório'), findsOneWidget);

    textFormField.controller!.text = 'test';
    formKey.currentState!.validate();
    await tester.pump();
    expect(formKey.currentState!.validate(), true);
    expect(find.text('Campo obrigatório'), findsNothing);
  });
}
