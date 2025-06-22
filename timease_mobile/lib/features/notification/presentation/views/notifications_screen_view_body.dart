import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';
import 'package:timease_mobile/core/utils/styles.dart';
import 'package:timease_mobile/core/widgets/custom_shimmer_loading.dart';
import 'package:timease_mobile/features/notification/presentation/views/manger/notifications_cubit/notifications_cubit.dart';
import 'package:timease_mobile/features/notification/presentation/views/manger/notifications_cubit/notifications_state.dart';
import 'package:timease_mobile/features/notification/presentation/views/widgets/notification_item.dart';
import '../../../../core/utils/function/logout.dart';

class NotificationsScreenViewBody extends StatefulWidget {
  const NotificationsScreenViewBody({super.key});

  @override
  State<NotificationsScreenViewBody> createState() =>
      _NotificationsScreenViewBodyState();
}

class _NotificationsScreenViewBodyState
    extends State<NotificationsScreenViewBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        NotificationsCubit notificationsCubit = NotificationsCubit.get(context);
        notificationsCubit.getUnSentNotifications(
            userId: CashHelper.getData('userId'), isTimer: false);
        return Future.delayed(Duration(seconds: 1));
      },
      child: BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetUnSentNotificationsSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 14,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 18,
                    ),
                    Text(
                      'Notifications',
                      style: Styles.textFormField.copyWith(
                        color: Colors.black,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.notificationsList.length,
                    itemBuilder: (context, index) {
                      return NotificationItem(
                        index: index,
                        notifications: state.notificationsList[index],
                        onTap: () async {
                          state.notificationsList[index].isRead = true;
                          NotificationsCubit.get(context)
                              .saveCashedNotifications(
                                  unSentNotifications: state.notificationsList);
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    logout(context: context);
                  },
                  child: Text('LOGOUT'),
                ),
              ],
            );
          } else {
            return CustomShimmerLoading();
          }
        },
      ),
    );
  }
}
