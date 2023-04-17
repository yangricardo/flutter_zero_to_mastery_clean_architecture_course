import 'package:advicer_app/data/datasources/advice.remote.datasource.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:test/test.dart';
import 'advice.remote.datasource.test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  group('AdviceRemoteDataSource', () {
    group('should return AdviceModel', () {
      test('when client response was 200 and has valid data', () {
        final mockClient = MockClient();
        final adviceRemoteDataSourceUnderTest =
            AdviceRemoteDatasourceImpl(client: mockClient);
      });
    });
  });
}
