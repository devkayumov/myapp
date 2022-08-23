import '../day.dart';

abstract class DayRepository {
  Future<Day> getDay({
    required double latitude,
    required double longtitude,
  });
}
