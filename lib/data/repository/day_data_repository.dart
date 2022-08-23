import 'package:myapp/domain/day.dart';
import 'package:myapp/domain/repository/day_repository.dart';
import 'package:myapp/data/api/api_util.dart';

class DayDataRepository extends DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  @override
  Future<Day> getDay({required double latitude, required double longitude}) {
    return _apiUtil.getDay(latitude: latitude, longitude: longitude);
  }
}
