import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/services/index.dart';

class UserStateWrapper extends StatelessWidget {
  const UserStateWrapper({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt.get<CartsBloc>()),
        BlocProvider.value(value: getIt.get<StxProductsBloc>()),
      ],
      child: child,
    );
  }
}
