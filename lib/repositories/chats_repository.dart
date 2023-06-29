import 'package:injectable/injectable.dart';

import 'package:test_proj/models/index.dart';
import 'package:test_proj/services/http/http_client.dart';

@injectable
class ChatsRepository {
  final HttpClient httpClient;

  ChatsRepository(this.httpClient);

  Future<List<Chat>> getChats() async {
    await Future.delayed(const Duration(seconds: 1));

    return List.generate(
      100,
      (index) => Chat(id: index, name: 'Chat $index'),
    );
  }
}
