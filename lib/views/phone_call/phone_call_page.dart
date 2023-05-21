import 'package:flutter/material.dart';

class PhoneCallPage extends StatelessWidget {
  const PhoneCallPage({Key? key, required this.routeArguments})
      : super(key: key);

  final Map<String, dynamic> routeArguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Call Page'),
      ),
      body: Text(
        routeArguments['message'].toString(),
      ),
    );
  }
}
