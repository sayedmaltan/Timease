import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/service_locator.dart';
import 'core/utils/cash_helper.dart';
import 'core/utils/function/build_theme_data.dart';
import 'core/utils/function/change_status_bar_color.dart';
import 'features/event/data/repos/event_repo_impl.dart';
import 'features/event/presentation/manger/event_cubit/user_events_cubit.dart';
import 'features/meeting/presentation/manger/meeting_cubit/meeting_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  changeStatusBarColor();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return UserEventsCubit(getIt.get<EventRepoImpl>());
          },
        ),
        BlocProvider(
          create: (context) => MeetingCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: buildThemeData(),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
