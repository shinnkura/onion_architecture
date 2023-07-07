import 'package:onion_architecture/application/types/analytics_event.dart';

abstract class FirebaseService {
  Future<void> init();
  Future<void> sendEvent(AnalyticsEvent event);
}
