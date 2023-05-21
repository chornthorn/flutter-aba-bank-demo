import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key, required this.routeArguments})
      : super(key: key);

  final Map<String, dynamic> routeArguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Page'),
      ),
      body: Text(
        routeArguments['message'].toString(),
      ),
    );
  }
}
