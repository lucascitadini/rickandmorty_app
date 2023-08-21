import 'package:rickandmorty_app/src/core/widgets/row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('row item has a title and description',
      (WidgetTester tester) async {
    await tester.pumpWidget(rowItemMockOnlyRequireds());
    final title = find.text('Test Title');
    final description = find.text('Test');
    final texts = find.byWidgetPredicate((widget) => widget is Text);

    expect(title, findsOneWidget);
    expect(description, findsOneWidget);
    expect(texts, findsNWidgets(2));
  });
}

Widget rowItemMockOnlyRequireds() {
  return const MaterialApp(
    home: Scaffold(
      body: RowItem(
        title: 'Test Title',
        description: 'Test',
      ),
    ),
  );
}
