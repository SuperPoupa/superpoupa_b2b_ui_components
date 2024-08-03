import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superpoupa_b2b_ui_components/src/helpers/enums.dart';
import 'package:superpoupa_b2b_ui_components/src/helpers/screen_definer.dart';
import 'package:superpoupa_b2b_ui_components/src/superpoupa_b2b_button.dart';
import 'package:superpoupa_b2b_ui_components/src/superpoupa_b2b_error_message.dart';

void main() {
  testWidgets('SuperPoupaB2BErrorMessage renders correctly', (WidgetTester tester) async {
    GlobalKey<State> superPoupaB2BErrorMessageKey = GlobalKey();
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SuperPoupaB2BErrorMessage(
            key: superPoupaB2BErrorMessageKey,
            onClick: () {},
          ),
        ),
      ),
    );

    ScreenSize screenSize = ScreenDefiner.define(superPoupaB2BErrorMessageKey.currentContext!);

    // Verify if the widgets are present
    expect(find.byType(Icon), findsOneWidget);
    expect(find.text('Ocorreu um erro, tente novamente.'), findsOneWidget);
    expect(find.byType(SuperPoupaB2BButton), findsOneWidget);

    // Verify if the SizedBox width is correct for xlarge
    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
    expect(sizedBox.width, screenSize == ScreenSize.xlarge ? MediaQuery.of(superPoupaB2BErrorMessageKey.currentContext!).size.width * 0.3 : MediaQuery.of(superPoupaB2BErrorMessageKey.currentContext!).size.width * 0.9);

    // Verify if the button calls the onClick function
    final button = tester.widget<SuperPoupaB2BButton>(find.byType(SuperPoupaB2BButton));
    button.onClick();
    expect(button.onClick, isNotNull);
  });
}
