import 'package:onion_architecture/application/types/analytics_event.dart';
import 'package:onion_architecture/application/interfaces/firebase.dart';

/// 開発環境用のFirebaseサービス
class FakeFirebaseService implements FirebaseService {
  @override
  Future<void> init() async {
    // DO NOTHING
  }

  @override
  Future<void> sendEvent(AnalyticsEvent event) async {
    // DO NOTHING
  }
}
