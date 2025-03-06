import 'package:flutter/material.dart';
import 'package:timease_mobile/core/utils/api_service.dart';
import 'package:timease_mobile/features/authentication/data/repos/auth_repo_impl.dart';

import '../../../../core/utils/service_locator.dart';

class NotificationsScreenViewBody extends StatelessWidget {
  const NotificationsScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () async {
          AuthRepoImpl authRepoImpl =
              AuthRepoImpl(apiService: getIt.get<ApiService>());
          authRepoImpl.logout(context: context);
        },
        child: Text('LOGOUT'),
      ),
    );
  }
}
