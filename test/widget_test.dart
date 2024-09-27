import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';
import 'package:app/home.dart';
import 'package:app/menu.dart';
import 'package:app/cart.dart';
import 'package:app/account.dart';

void main() {
  testWidgets('HomeScreen navigation test', (WidgetTester tester) async {

    await tester.pumpWidget(const DivineBlissApp());

    expect(find.text('DIVINE BLISS'), findsOneWidget);

    expect(find.byType(BottomNavigationBar), findsOneWidget);

    await tester.tap(find.text('Menu'));
    await tester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);

    await tester.tap(find.text('Cart'));
    await tester.pumpAndSettle();

    expect(find.text('Cart'), findsOneWidget);

    await tester.tap(find.text('Account'));
    await tester.pumpAndSettle();

    expect(find.text('Account'), findsOneWidget);

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();


    expect(find.text('DIVINE BLISS'), findsOneWidget);
  });
}
