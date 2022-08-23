import 'package:myapp/data/api/request/get_day_body.dart';
import 'package:myapp/data/api/service/sunrise_service.dart';

import 'package:myapp/domain/day.dart';

import 'package:myapp/data/mapper/day_mapper.dart';

class ApiUtil {
  final SunriseService _sunriseService;

  ApiUtil(this._sunriseService);

  Future<Day> getDay({
    required double latitude,
    required double longitude,
  }) async {
    final body = GetDayBody(latitude: latitude, longitude: longitude);
    final result = await _sunriseService.getDay(body: body);
    return DayMapper.fromApi(result);
  }
}
