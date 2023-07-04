import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_proj/localization/index.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/router/index.dart';
import 'package:test_proj/screens/home/users/users_bloc.dart';
import 'package:test_proj/screens/home/users/widgets/user_widget.dart';

@RoutePage()
class UsersScreen extends StatelessWidget implements AutoRouteWrapper {
  const UsersScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    context.read<UsersBloc>().load();

    return this;
  }

  @override
  Widget build(BuildContext context) {
    EasyLocalization.of(context);
    final cartsBloc = context.read<UsersBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.users.tr()),
      ),
      body: RefreshIndicator(
        onRefresh: cartsBloc.loadAsyncFuture,
        child: CustomScrollView(
          slivers: [
            BlocBuilder<UsersBloc, NetworkListState>(
              builder: (context, state) {
                switch (state.status) {
                  case NetworkStatus.initial:
                  case NetworkStatus.loading:
                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  case NetworkStatus.success:
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final user = state.data[index];

                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: UserWidget(user: user),
                          );
                        },
                        childCount: state.data.length,
                      ),
                    );

                  case NetworkStatus.failure:
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(state.errorMsg),
                      ),
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
