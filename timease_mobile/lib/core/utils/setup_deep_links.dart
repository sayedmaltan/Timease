import 'package:app_links/app_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:timease_mobile/core/utils/app_router.dart';
import 'package:timease_mobile/core/utils/cash_helper.dart';

final AppLinks _appLinks = AppLinks();

Future<bool> setupDeepLinkHandler(BuildContext context) async {
  bool isNavigate = false;

  // // Handle incoming deep links
  // _appLinks.uriLinkStream.listen((Uri? uri) async {
  //   if (uri != null) {
  //     final result = await _handleDeepLink(uri, context);
  //     if (result) isNavigate = true;
  //   }
  // });

  // Handle initial deep link
  final Uri? initialLink = await _appLinks.getInitialLink();
  if (initialLink != null) {
    final result = await _handleDeepLink(initialLink, context);
    if (result) isNavigate = true;
  }
  return isNavigate;
}

Future<bool> _handleDeepLink(Uri uri, BuildContext context) async {
  if (uri.pathSegments.isNotEmpty && uri.pathSegments.first == 'eventId') {
    final eventId = uri.pathSegments.last;
    if (eventId.isNotEmpty) {
      if (CashHelper.getData('userId') != null) {
        context.go(AppRouter.homeScreen, extra: 0);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.push(
            AppRouter.tryBookMeetingView,
            extra: TextEditingController(text: eventId),
          );
        });
      } else {
        context.go(AppRouter.authScreen);
      }
      return true;
    }
  }
  return false;
}
