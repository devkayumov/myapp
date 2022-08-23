import 'package:dio/dio.dart';

import 'package:myapp/data/api/model/api_day.dart';
import 'package:myapp/data/api/request/get_day_body.dart';

class SunriseService {
  static const _baseUrl_ = 'https://api.sunrise-sunset.org';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _baseUrl_),
  );

  Future<ApiDay> getDay({required GetDayBody body}) async {
    final response = await _dio.get(
      '/json',
      queryParameters: body.toApi(),
    );
    return ApiDay.fromApi(response.data);
  }
}
