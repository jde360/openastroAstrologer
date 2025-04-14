import 'package:intl/intl.dart';

class AppFormatedTime {
  static String formatTime(String time) {
    DateTime today = DateTime.now();
    DateTime todayStr = DateFormat('yyyy-MM-dd').parse(today.toString());
    DateTime serverStr = DateFormat('yyyy-MM-dd').parse(time);

    if (todayStr == serverStr) {
      return 'Today ${DateFormat.jm().format(DateTime.parse(time).toLocal())}';
    }

    if (DateFormat('yyyy-MM-dd')
            .parse(today.subtract(const Duration(days: 1)).toString()) ==
        serverStr) {
      return 'Yesterday ${DateFormat.jm().format(DateTime.parse(time).toLocal())}';
    }

    return DateFormat.MMMEd().add_jm().format(DateTime.parse(time).toLocal());
  }

  static String getDuration(String start, String end) {
    Duration duration = DateTime.parse(end).difference(DateTime.parse(start));
    return duration.toString().split('.').first.padLeft(8, "0");
  }
}
