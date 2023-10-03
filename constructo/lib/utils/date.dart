import 'package:intl/intl.dart';

extension DateUtils on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day && tomorrow.month == month && tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day && yesterday.month == month && yesterday.year == year;
  }
}

DateFormat dateStartFormatter = DateFormat('EEEE, hh - ');
DateFormat dateEndFormatter = DateFormat('hha');
DateFormat dateFormatter = DateFormat('y-MM-dd');
DateFormat hourMinuteFormatter = DateFormat('hh:mma');

formatToPrefixedWeekDay(DateTime date, {bool useToday = false}) {
  var suffix = "th";
  var digit = date.day % 10;
  if ((digit > 0 && digit < 4) && (date.day < 11 || date.day > 13)) {
    suffix = ["st", "nd", "rd"][digit - 1];
  }
  String formattedDate = DateFormat("d'$suffix' EEEE").format(date);
  if (date.isToday && useToday) {
    formattedDate = "${formattedDate.split(" ")[0]} Today";
  }
  return formattedDate;
}

String formatDuration(Duration d) {
  var seconds = d.inSeconds;
  final days = seconds ~/ Duration.secondsPerDay;
  seconds -= days * Duration.secondsPerDay;
  final hours = seconds ~/ Duration.secondsPerHour;
  seconds -= hours * Duration.secondsPerHour;
  final minutes = seconds ~/ Duration.secondsPerMinute;
  seconds -= minutes * Duration.secondsPerMinute;

  final List<String> tokens = [];
  if (days != 0) {
    tokens.add('${days}day');
  }
  if (tokens.isNotEmpty || hours != 0) {
    tokens.add('${hours}hr');
  }
  if (tokens.isNotEmpty || minutes != 0) {
    tokens.add('${minutes}mins');
  }

  return tokens.join(' ');
}

String formatDurationToTimer(duration) => duration != null ? RegExp(r'((^0*[1-9]\d*:)?\d{2}:\d{2})\.\d+$').firstMatch("$duration")?.group(1) ?? '$duration' : '00:00';
