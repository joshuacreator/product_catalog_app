import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:product_catalog_app/src/utils/colours.dart';
import 'package:product_catalog_app/src/views/screens/notifications_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Hi Joshua',
            style: TextStyle(
              color: Colours.primary,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: () {
              context.pushNamed(NotificationsScreen.name);
            },
            icon: Icon(
              Icons.notifications_rounded,
              color: Colours.primary,
            ),
          ),
        ],
      ),
    );
  }
}
