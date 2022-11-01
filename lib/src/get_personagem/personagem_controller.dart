


import 'package:harrypotter_api/src/get_personagem/personagem_repository.dart';

import '../models/personagem.dart';

class SentenceController {
  final SentenceRepository repository;

  const SentenceController({required this.repository});

  Future<List<Personagem>> getSentence() async {
    try {
      final response = await repository.getSentence();
      return response;
    } catch (e) {
      /// crashlytics.logError(e);
      /// updateState(StateError(e));
      rethrow;
    }
  }
}
