import 'package:flutter/material.dart';
import 'package:test_proj/models/index.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    required this.user,
    super.key,
  });

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${user.name?.firstname} ${user.name?.lastname}'),
      subtitle: Text('${user.email} ${user.phone}'),
      onTap: _openUserMode,
    );
  }

  void _openUserMode() {}
}
