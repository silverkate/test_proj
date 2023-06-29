import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/services/index.dart';
import 'package:test_proj/styles/index.dart';
import 'package:test_proj/widgets/app_drawer/app_drawer_menu_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final firstName = getIt<AuthBloc>().state.userProfile.name?.firstname ?? '';

    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      color: AppColors.white,
      child: Drawer(
        elevation: 3,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: AppColors.black,
                      backgroundImage: AssetImage(Assets.images.logoShort.path),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    firstName,
                    style: const TextStyle(
                      color: AppColors.grey,
                    ),
                  ),
                ),
                const Divider(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      AppDrawerMenuItem(
                        text: LocaleKeys.changePassword.tr(),
                        iconData: FontAwesomeIcons.lock,
                      ),
                      GestureDetector(
                        child: AppDrawerMenuItem(
                          text: LocaleKeys.languageName.tr(),
                          iconData: FontAwesomeIcons.globe,
                        ),
                        onTap: () async {
                          final newLocale =
                              context.locale == context.supportedLocales[0]
                                  ? context.supportedLocales[1]
                                  : context.supportedLocales[0];

                          await context.setLocale(newLocale);
                        },
                      ),
                      GestureDetector(
                        child: AppDrawerMenuItem(
                          text: LocaleKeys.signOut.tr(),
                          iconData: FontAwesomeIcons.rightFromBracket,
                        ),
                        onTap: () {
                          getIt<AuthBloc>().add(const AuthEvent.signOut());
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
