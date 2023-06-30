import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/services/index.dart';
import 'package:test_proj/styles/index.dart';
import 'package:test_proj/widgets/index.dart';

import 'login_form_bloc.dart';
import 'widgets/index.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginFormBloc>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final mainContainerWidth = screenSize.width * 0.85;

    return CustomFormBlocListener(
      formBloc: context.read<LoginFormBloc>(),
      onFailure: _showError,
      onSuccess: _qq,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          color: Colors.lightBlue,
          child: SingleChildScrollView(
            child: SizedBox(
              height: max(screenSize.height, 600),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomCard(
                    width: mainContainerWidth,
                    height: 450,
                    slotWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Assets.images.logo.image(
                            width: 180,
                            height: 90,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const LoginForm(),
                        const Spacer()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showError(BuildContext context, FormBlocState<dynamic, String> state) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(LocaleKeys.error.tr()),
        content: Text(state.error ?? ''),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              context.popRoute();
            },
            child: Text(LocaleKeys.ok.tr()),
          ),
        ],
      ),
    );
  }

  void _qq(BuildContext context, FormBlocState<dynamic, String> state) {
    // submit success
    // -> if state is create/edit product, then products bloc.add item state.response cast to product
    // if edit -> edit item
    // pop / navigate back
  }
}
