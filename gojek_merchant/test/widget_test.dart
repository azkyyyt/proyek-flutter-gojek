import 'package:flutter_test/flutter_test.dart';
import 'package:gojek_merchant/main.dart';

void main() {
  testWidgets('Merchant App initial render smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MajuRideMerchantApp());
    expect(find.byType(MajuRideMerchantApp), findsOneWidget);
  });
}
