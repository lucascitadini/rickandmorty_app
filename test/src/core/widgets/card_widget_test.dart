import 'package:rickandmorty_app/src/core/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('card widget has a title and subTitle',
      (WidgetTester tester) async {
    await tester.pumpWidget(cardMockOnlyRequireds());
    final title = find.text('Test Title');
    final subTitle = find.text('New Test');
    final texts = find.byWidgetPredicate((widget) => widget is Text);

    expect(title, findsOneWidget);
    expect(subTitle, findsOneWidget);
    expect(texts, findsNWidgets(2));
  });

  testWidgets('card widget has a title, subTitle and date',
      (WidgetTester tester) async {
    await tester.pumpWidget(cardMockWithDate());
    final title = find.text('Test Title');
    final subTitle = find.text('New Test');
    final texts = find.byWidgetPredicate((widget) => widget is Text);

    expect(title, findsOneWidget);
    expect(subTitle, findsOneWidget);
    expect(texts, findsNWidgets(3));
  });
}

Widget cardMockOnlyRequireds() {
  return const MaterialApp(
    home: Scaffold(
      body: CardWidget(
        title: 'Test Title',
        subTitle: 'New Test',
      ),
    ),
  );
}

Widget cardMockWithDate() {
  return const MaterialApp(
    home: Scaffold(
      body: CardWidget(
        title: 'Test Title',
        subTitle: 'New Test',
        date: '23/05/2023',
      ),
    ),
  );
}
