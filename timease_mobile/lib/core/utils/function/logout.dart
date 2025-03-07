import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_router.dart';
import '../cash_helper.dart';

void logout({required BuildContext context}) {
  CashHelper.removeData('refreshToken');
  CashHelper.removeData('accessToken');
  CashHelper.removeData('userId');
  context.go(AppRouter.authScreen);
}