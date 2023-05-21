import 'package:aba_bank_mobile/views/main_page.dart';
import 'package:aba_bank_mobile/views/notification/notification_page.dart';
import 'package:aba_bank_mobile/views/phone_call/phone_call_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? appRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => MainPage());
    case '/notification':
      final routeArguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => NotificationPage(
          routeArguments: routeArguments,
        ),
      );
    case '/phone_call':
      final routeArguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder: (context) => PhoneCallPage(routeArguments: routeArguments),
      );
    default:
      return MaterialPageRoute(builder: (context) => MainPage());
  }
}
