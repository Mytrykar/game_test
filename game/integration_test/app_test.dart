import 'package:integration_test/integration_test.dart';

import 'home_page_test_web.dart' if (dart.library.io) 'home_page_test_io.dart'
    as test_home_page;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  test_home_page.main();
}
