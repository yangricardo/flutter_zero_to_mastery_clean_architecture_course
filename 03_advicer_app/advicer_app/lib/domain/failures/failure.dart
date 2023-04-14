abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class GeneralFailure extends Failure {}

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, cache failed. Please try again!';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return serverFailureMessage;
    case CacheFailure:
      return cacheFailureMessage;
    default:
      return generalFailureMessage;
  }
}
