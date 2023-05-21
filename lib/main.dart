import 'package:aba_bank_mobile/routes/app_route.dart';
import 'package:aba_bank_mobile/utilities/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABA Bank Mobile update',
      onGenerateRoute: appRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
          error: redColor,
        ),
      ),
    );
  }
}
