import 'package:dio/dio.dart';

import '../../cache/cache_helper.dart';
import 'end_points.dart';
// import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
// import 'package:happy_tech_mastering_api_with_flutter/core/api/end_ponits.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
    CacheHelper().getData(key: ApiKey.token) != null
        ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
        : null;
    super.onRequest(options, handler);
  }
}
