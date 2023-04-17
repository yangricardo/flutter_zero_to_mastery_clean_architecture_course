import 'dart:convert';

import 'package:advicer_app/data/exceptions/exceptions.dart';
import 'package:advicer_app/data/models/advice.model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  /// requests a random advice from api
  /// returns [AdviceModel] if successful
  /// throws a server-Exception if status code is not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final http.Client client;

  AdviceRemoteDatasourceImpl({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {
        'content-type': 'application/json ',
      },
    );
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
