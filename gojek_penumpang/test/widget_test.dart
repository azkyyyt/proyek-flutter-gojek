import 'package:flutter_test/flutter_test.dart';
import 'package:gojek_penumpang/main.dart';

void main() {
  testWidgets('Penumpang App initial render smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MajuRidePenumpangApp());
    expect(find.byType(MajuRidePenumpangApp), findsOneWidget);
  });
}
