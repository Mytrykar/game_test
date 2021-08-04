class TimerTimeAgo {
  ///Придает секундам читабельный вид
  String durationTransform(int seconds) {
    Duration d = Duration(seconds: seconds);
    List<String> parts = d.toString().split(':');
    StringBuffer result = StringBuffer();

    if (d.inHours != 0) {
      result.write('hour: ${parts[0].substring(_checkNull(parts[0]))} ');
    }
    if (d.inMinutes != 0) {
      result.write('minute: ${parts[1].substring(_checkNull(parts[1]))} ');
    }
    if (d.inSeconds != 0) {
      result.write(
          'sec: ${parts[2].substring(_checkNull(parts[2]), parts[2].indexOf("."))}');
    }
    return result.toString();
  }

  ///Проверяет строку, всегда возращает число которое не начинается на 0
  int _checkNull(String str) {
    int startStr = 0;
    if (str.startsWith("0")) {
      startStr = 1;
    }
    return startStr;
  }
}
