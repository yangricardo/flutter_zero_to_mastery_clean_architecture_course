import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LocalDataServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
