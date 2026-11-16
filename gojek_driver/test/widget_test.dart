import 'package:flutter_test/flutter_test.dart';
import 'package:gojek_driver/main.dart';

void main() {
  testWidgets('Driver App initial render smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MajuRideDriverApp());
    expect(find.byType(MajuRideDriverApp), findsOneWidget);
  });
}
