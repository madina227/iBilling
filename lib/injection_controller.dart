import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/i_billing/data/datasource/remote/api/api_base.dart';
import 'features/i_billing/data/datasource/remote/api/app_api.dart';

final di = GetIt.instance;

Future<void> setup() async {
  di.registerSingleton(ApiBase(Dio(BaseOptions(
      baseUrl: 'https://6428033b161067a83b051975.mockapi.io/api/v1',
      connectTimeout: const Duration(seconds: 60)))));
  di.registerFactory(() => AppApi(di.get()));
}
