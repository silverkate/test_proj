import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/blocs/index.dart';
import 'package:test_proj/services/index.dart';

class HomeStateWrapper extends StatelessWidget {
  const HomeStateWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ChatsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<PostsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<ProductsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<StxProductsBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<StxCategoriesBloc>(),
        ),
      ],
      child: child,
    );
  }
}
