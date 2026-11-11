import 'package:flutter_test/flutter_test.dart';
import 'package:mtongamart/main.dart';

void main() {
  testWidgets('App load smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const Home());
    expect(find.byType(Home), findsOneWidget);
  });
}
