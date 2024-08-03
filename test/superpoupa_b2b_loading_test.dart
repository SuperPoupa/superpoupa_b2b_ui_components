import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superpoupa_b2b_ui_components/superpoupa_b2b_ui_components.dart';

void main()
 {
  testWidgets('SuperPoupaB2BLoading widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: SuperPoupaB2BLoading(),
    ));

    // Verify that the widget is centered.
    expect(find.byType(Center), findsOneWidget);

    // Verify that the main SizedBox has the correct size.
    expect(find.byType(SizedBox).first, findsOneWidget);
    final SizedBox sizedBox = tester.widget(find.byType(SizedBox).first);
    expect(sizedBox.width, 180);
    expect(sizedBox.height, 180);

    // Verify that the circular progredd SizedBox has the correct size.
    expect(find.byType(SizedBox).at(1), findsOneWidget);
    final SizedBox mainSizedBox = tester.widget(find.byType(SizedBox).at(1));
    expect(mainSizedBox.width, 80);
    expect(mainSizedBox.height, 80);

    // Verify that the Stack has two children.
    expect(find.byType(Stack), findsOneWidget);
    expect(find.descendant(of: find.byType(Stack), matching: find.byType(Align)), findsNWidgets(2));

    // Verify that the CircularProgressIndicator has the correct color.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    final CircularProgressIndicator circularProgressIndicator = tester.widget(find.byType(CircularProgressIndicator));
    expect(circularProgressIndicator.color, Colors.orange[700]);

    // Verify that the Text widget has the correct text and style.
    expect(find.byType(Text), findsOneWidget);
    final Text text = tester.widget(find.byType(Text));
    expect(text.data, '\$');
    expect(text.style!.color, Colors.orange[700]);
    expect(text.style!.fontSize, 28);
    expect(text.style!.fontWeight, FontWeight.bold);
  });
}
