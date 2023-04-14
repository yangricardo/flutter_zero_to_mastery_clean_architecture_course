import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'ADVICE_API_URL')
  static const adviceApiUrl = _Env.adviceApiUrl;
}
