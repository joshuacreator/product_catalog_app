import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsScreen extends ConsumerWidget {
  static String name = "notifications", path = "notifications";

  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications")),
      body: Center(
        child: Text(
          "Nothing to see here :)",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
