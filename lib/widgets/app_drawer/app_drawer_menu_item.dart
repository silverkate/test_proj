import 'package:flutter/material.dart';
import 'package:test_proj/styles/colors.dart';

class AppDrawerMenuItem extends StatelessWidget {
  const AppDrawerMenuItem({
    required this.text,
    required this.iconData,
    super.key,
  });

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: AppColors.grey,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: AppColors.grey,
        ),
      ),
    );
  }
}
