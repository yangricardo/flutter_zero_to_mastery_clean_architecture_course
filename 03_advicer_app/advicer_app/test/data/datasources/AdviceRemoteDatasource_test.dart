import 'package:advicer_app/data/datasources/advice.remote.datasource.dart';
import 'package:advicer_app/data/exceptions/exceptions.dart';
import 'package:advicer_app/data/models/advice.model.dart';
import 'package:advicer_app/env/env.dart';
import 'package:http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'AdviceRemoteDatasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDataSource', () {
    group('should return AdviceModel', () {
      test('when Client response was 200 and has valid data', () async {
        final mockClient = MockClient();
        final adviceRemoteDatasourceUnderTest =
            AdviceRemoteDatasourceImpl(client: mockClient);
        const responseBody = '{"advice": "test advice", "advice_id": 1}';

        when(mockClient.get(
          Uri.parse(Env.adviceApiUrl),
          headers: {
            'content-type': 'application/json ',
          },
        )).thenAnswer(
            (realInvocation) => Future.value(Response(responseBody, 200)));

        final result =
            await adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi();

        expect(result, AdviceModel(advice: 'test advice', id: 1));
      });
    });
    group('should throw', () {
      test('a Server Exception when client response was not 200', () async {
        final mockClient = MockClient();
        final adviceRemoteDatasourceUnderTest =
            AdviceRemoteDatasourceImpl(client: mockClient);

        when(mockClient.get(
          Uri.parse(Env.adviceApiUrl),
          headers: {
            'content-type': 'application/json ',
          },
        )).thenAnswer((realInvocation) => Future.value(Response('', 201)));

        expect(() => adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi(),
            throwsA(isA<ServerException>()));
      });
      test('a type error when client response was 200 and has no valid data',
          () async {
        final mockClient = MockClient();
        final adviceRemoteDatasourceUnderTest =
            AdviceRemoteDatasourceImpl(client: mockClient);
        const responseBody = '{"advice": "test advice"}';
        when(mockClient.get(
          Uri.parse(Env.adviceApiUrl),
          headers: {
            'content-type': 'application/json ',
          },
        )).thenAnswer(
            (realInvocation) => Future.value(Response(responseBody, 200)));

        expect(() => adviceRemoteDatasourceUnderTest.getRandomAdviceFromApi(),
            throwsA(isA<TypeError>()));
      });
    });
  });
}
