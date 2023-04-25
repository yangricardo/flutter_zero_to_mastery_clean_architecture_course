import 'package:uuid/uuid.dart';

class UniqueId {
  const UniqueId._(this.value);
  final String value;

  factory UniqueId() {
    return UniqueId._(const Uuid().v4());
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    return UniqueId._(uniqueId);
  }
}

class CollectionId extends UniqueId {
  const CollectionId._(String value) : super._(value);

  factory CollectionId() {
    return CollectionId._(const Uuid().v4());
  }

  factory CollectionId.fromUniqueString(String uniqueId) {
    return CollectionId._(uniqueId);
  }
}

class EntryId extends UniqueId {
  const EntryId._(String value) : super._(value);

  factory EntryId() {
    return EntryId._(const Uuid().v4());
  }

  factory EntryId.fromUniqueString(String uniqueId) {
    return EntryId._(uniqueId);
  }
}
