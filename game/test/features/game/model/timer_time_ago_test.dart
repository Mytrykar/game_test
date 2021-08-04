import 'package:flutter_test/flutter_test.dart';
import 'package:game/features/game/model/timer_time_ago.dart';

void main() {
  test('Получиль время игры', () {
    late int second = 12111;

    expect(
        TimerTimeAgo().durationTransform(second), "hour: 3 minute: 21 sec: 51");
  });
}
