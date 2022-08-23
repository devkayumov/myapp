import 'package:myapp/domain/day.dart';

abstract class DayRepository {
  Future<Day> getDay({
    required double latitude,
    required double longitude,
  });
}
