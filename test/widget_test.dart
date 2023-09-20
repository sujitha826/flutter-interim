// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_interim_task/screens/cart_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_interim_task/appConstants/constants.dart';
import 'package:flutter_interim_task/screens/item_screen.dart';
import 'package:flutter_interim_task/main.dart';

void main() {
  testWidgets('Test CartScreen child widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // Build our widget.
    await tester.pumpWidget(const MaterialApp(
      home: CartScreen(),
    ));

    // Appbar title text
    expect(find.text(AppConstants.cart), findsOneWidget);

    // Verify the presence of the back button.
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    // Verify the presence of the favorite icon.
    expect(find.byIcon(Icons.favorite_border_outlined), findsOneWidget);

    // Verify that the "ItemDetailsFinal" state is displayed correctly.
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap the back button
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();
    // The screen should be popped.
    expect(find.byType(ItemScreen), findsNothing);

    // Tap the ElevatedButton
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
  });

  testWidgets('Test ItemScreen child widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    // Build our widget.
    await tester.pumpWidget(const MaterialApp(
      home: ItemScreen(), // Assuming you have a StatefulWidget with this name
    ));

    // Verify that the title text is displayed.
    expect(find.text(AppConstants.selectedItem), findsOneWidget);

    // Verify the presence of the back button.
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    // Verify the presence of the favorite icon.
    expect(find.byIcon(Icons.favorite_border_outlined), findsOneWidget);

    // Verify that the "ItemDetailsFinal" state is displayed correctly.
    expect(find.byType(Card), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap the back button
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();
    // The screen should be popped.
    expect(find.byType(ItemScreen), findsNothing);

    // Tap the ElevatedButton
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
  });
}
