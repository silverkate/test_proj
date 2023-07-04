import 'package:injectable/injectable.dart';
import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/index.dart';

@lazySingleton
class UsersBloc
    extends NetworkListBloc<UserProfile, NetworkListState<UserProfile>> {
  final UserRepository repository;

  UsersBloc(this.repository) : super(const NetworkListState(data: []));

  @override
  Future<List<UserProfile>> onLoadAsync() {
    return repository.getUsers();
  }

  @override
  bool equals(UserProfile item1, UserProfile item2) {
    return item1.id == item2.id;
  }
}
