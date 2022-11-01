import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/personagem.dart';



class SentenceRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://hp-api.herokuapp.com/api',
      headers: {
        'Content-type': 'application/json',
      },
    ),
  );

  Future<List<Personagem>> getSentence() async {
    try {
      final response = await dio.get('/characters');

      final data = List.from(response.data);

      final mapList = data.map((e) => Map<String, dynamic>.from(e)).toList();

      return mapList.map((e) => Personagem.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
