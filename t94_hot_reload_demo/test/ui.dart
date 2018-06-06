import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:t94_hot_reload_demo/main.dart';

void main() {
  testWidgets('Non-negative quantity', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CartList()));

    await tester.tap(find.byIcon(Icons.add_shopping_cart));
    await tester.pump();

    expect(find.widgetWithText(Card, '手表'), findsOneWidget);

    await tester.tap(find.descendant(
      of: find.widgetWithText(Card, '手表'),
      matching: find.byIcon(Icons.remove),
    ));
    await tester.tap(find.descendant(
      of: find.widgetWithText(Card, '手表'),
      matching: find.byIcon(Icons.remove),
    ));
    await tester.pump();

    expect(
      tester.widget<Text>(
        find.descendant(
          of: find.widgetWithText(Card, '手表'),
          matching: find.byType(Text),
        ).at(1),
      ).data,
      '0',
    );
  });
}
