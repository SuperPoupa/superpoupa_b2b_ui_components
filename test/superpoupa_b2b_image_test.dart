import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superpoupa_b2b_ui_components/superpoupa_b2b_ui_components.dart';

void main() {
  testWidgets('SuperPoupaB2BImage displays image from imageUrl when provided', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SuperPoupaB2BImage(
          width: 100,
          height: 100,
          imageUrl: 'https://example.com/image.jpg',
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.byIcon(Icons.image_not_supported_outlined), findsNothing);
  });

  testWidgets('SuperPoupaB2BImage displays image from productEan when imageUrl is null', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SuperPoupaB2BImage(
          width: 100,
          height: 100,
          productEan: '1234567890',
        ),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.byIcon(Icons.image_not_supported_outlined), findsNothing);
    expect((tester.widget(find.byType(Image)) as Image).image, isA<NetworkImage>());
    expect((tester.widget(find.byType(Image)) as Image).image.toString(), contains('https://cdn-cosmos.bluesoft.com.br/products/1234567890'));
  });

  testWidgets('SuperPoupaB2BImage displays placeholder when no image is provided', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SuperPoupaB2BImage(
          width: 100,
          height: 100,
        ),
      ),
    );

    expect(find.byType(Image), findsNothing);
    expect(find.byIcon(Icons.image_not_supported_outlined), findsOneWidget);
  });

  testWidgets('SuperPoupaB2BImage uses BoxFit.cover', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SuperPoupaB2BImage(
          width: 100,
          height: 100,
          imageUrl: 'https://example.com/image.jpg',
        ),
      ),
    );

    final image = tester.widget<Image>(find.byType(Image));
    expect(image.fit, BoxFit.cover);
  });

  testWidgets('SuperPoupaB2BImage has correct width and height', (WidgetTester tester) async {
    const width = 200.0;
    const height = 150.0;
    await tester.pumpWidget(
      const MaterialApp(
        home: SuperPoupaB2BImage(
          width: width,
          height: height,
          imageUrl: 'https://example.com/image.jpg',
        ),
      ),
    );

    final imageWidget = tester.widget<Container>(find.byType(Container));
    expect(imageWidget.constraints!.maxWidth, width);
    expect(imageWidget.constraints!.maxHeight, height);
  });
}
