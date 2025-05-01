import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_router.dart';
import '../cash_helper.dart';

void logout({ BuildContext? context}) {
  CashHelper.removeData('refreshToken');
  CashHelper.removeData('accessToken');
  CashHelper.removeData('userId');
  if(context!=null) {
    context.go(AppRouter.authScreen);
  } else {
    AppRouter.router.go(AppRouter.authScreen);
  }
}