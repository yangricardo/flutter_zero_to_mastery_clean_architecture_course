import 'package:advicer_app/domain/entities/advice.entity.dart';

abstract class AdviceRepo {
  Future<AdviceEntity> getAdviceFromDataSource();
}
