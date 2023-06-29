import 'package:flutter/material.dart';
import 'package:test_proj/core/index.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/router/index.dart';

export 'pages/index.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.settings.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => RootScaffold.openEndDrawer(context),
          ),
        ],
      ),
      body: Center(
        child: Text(
          LocaleKeys.settingsScreenTitle.tr(),
        ),
      ),
    );
  }
}
