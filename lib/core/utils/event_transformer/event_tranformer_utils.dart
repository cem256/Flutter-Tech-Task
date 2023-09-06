import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

/// Class containing static methods to transform events
abstract final class EventTransformerUtils {
  /// Limits the frequency of events to the specified duration
  static EventTransformer<Event> throttle<Event>(Duration duration) {
    return (events, mapper) => events.throttle(duration).switchMap(mapper);
  }
}
