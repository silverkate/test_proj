import 'package:flutter/material.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/services/index.dart';

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
      onTap: () => _openUserMode(context),
    );
  }

  Future<void> _openUserMode(BuildContext context) async {
    getIt.pushNewScope(init: configureHrDependencies);

    await context.router.push(const UserModalRoute());

    await getIt.popScope();
  }
}
