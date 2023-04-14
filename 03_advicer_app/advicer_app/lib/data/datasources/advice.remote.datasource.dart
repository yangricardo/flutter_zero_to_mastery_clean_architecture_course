import 'dart:convert';

import 'package:advicer_app/data/exceptions/exceptions.dart';
import 'package:advicer_app/data/models/advice.model.dart';
import 'package:advicer_app/env/env.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDatasource {
  /// requests a random advice from api
  /// returns [AdviceModel] if successful
  /// throws a server-Exception if status code is not 200
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final client = http.Client();

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse(Env.adviceApiUrl),
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
