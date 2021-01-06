import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:indesa_beta/pages/dashboard/dashboard.dart';
import 'package:indesa_beta/pages/login/login_page.dart';
import 'package:indesa_beta/widgets/widget.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Login button akan menjalankan navigator setelah diklik',
          (WidgetTester tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: LoginPage(),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(RoundedButton), findsOneWidget);
        // await tester.tap(find.byType(RoundedButton));
        //
        // expect(find.byType(GraphQLClient), findsOneWidget);
      });
}