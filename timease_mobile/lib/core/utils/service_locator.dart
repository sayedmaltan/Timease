

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:timease_mobile/features/event/data/repos/event_repo_impl.dart';

import '../../features/authentication/data/repos/auth_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService( dio: Dio(),));
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
     apiService: getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<EventRepoImpl>(
    EventRepoImpl(apiService: getIt.get<ApiService>())
  );
}
