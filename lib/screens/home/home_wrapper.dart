import 'package:flutter/material.dart';

import 'package:test_proj/router/index.dart';
import 'package:test_proj/services/index.dart';
import 'home_state_wrapper.dart';

@RoutePage(name: 'HomeRouter')
class HomeWrapperScreen extends StatefulWidget {
  const HomeWrapperScreen({super.key});

  @override
  State<HomeWrapperScreen> createState() => _HomeWrapperScreenState();
}

class _HomeWrapperScreenState extends State<HomeWrapperScreen> {
  @override
  void initState() {
    super.initState();

    getIt.pushNewScope(init: configureUserDependencies);
  }

  @override
  Widget build(BuildContext context) {
    return const HomeStateWrapper(child: AutoRouter());
  }

  @override
  void dispose() {
    getIt.popScope();

    super.dispose();
  }
}
