@TestOn("browser")
import 'package:flutter_test/flutter_test.dart';
import 'package:game/core/app.dart';

void main() {
  testWidgets('material app ...', (tester) async {
    tester.pumpWidget(const App());
  });
}
