import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onion_architecture/application/interfaces/firebase.dart';
import 'package:onion_architecture/application/interfaces/logger.dart';
import 'package:onion_architecture/application/config/flavor.dart';
import 'package:onion_architecture/application/types/flavor.dart';
// DI は特別に外レイヤーをimportする
import 'package:onion_architecture/infrastructure/firebase/fake_firebase.dart';
import 'package:onion_architecture/infrastructure/firebase/firebase.dart';
import 'package:onion_architecture/infrastructure/log/fake_logger.dart';
import 'package:onion_architecture/infrastructure/log/logger.dart';

/// Firebase
final firebaseProvider = Provider<FirebaseService>(
  (ref) {
    switch (flavor) {
      case Flavor.dev:
        return FakeFirebaseService();
      case Flavor.stg:
        return FakeFirebaseService();
      case Flavor.prd:
        return DefaultFirebaseService();
    }
  },
);

/// Logger
final loggerProvider = Provider<Logger>(
  (ref) {
    switch (flavor) {
      case Flavor.dev:
        return FakeLogger();
      case Flavor.stg:
        return FakeLogger();
      case Flavor.prd:
        return DefaultLogger();
    }
  },
);
