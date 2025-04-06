import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/features/event/data/repos/event_repo_impl.dart';
import 'package:timease_mobile/features/meeting/data/repos/meeting_repo_impl.dart';
import '../../features/authentication/data/repos/auth_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  final dio = Dio()
    ..interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        filter: (options, args) => true,
      ),
    )
    ..options.headers["Authorization"] =
        "Bearer ${CashHelper.getData('accessToken')}";

  getIt.registerSingleton<Dio>(dio);

  getIt.registerSingleton<ApiService>(
    ApiService(
      dio: getIt.get<Dio>(),
    ),
  );
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
    apiService: getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<EventRepoImpl>(
      EventRepoImpl(apiService: getIt.get<ApiService>()));

  getIt.registerSingleton<MeetingRepoImpl>(
    MeetingRepoImpl(apiService:  getIt.get<ApiService>())
  );

  ApiService apiService = ApiService(dio: getIt.get<Dio>());
  apiService.interceptorsWrapper();
}
