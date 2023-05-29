import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_challenge/data/models/response.dart';

class ApiService {
  final String baseUrl = 'https://pokeapi.co/api/v2/pokemon';

  Future<Response> get(String endpoint) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Response(data: data, isSuccess: true);
      } else {
        return Response(
            data: null,
            isSuccess: false,
            errorMessage: 'Error en la solicitud.');
      }
    } catch (e) {
      return Response(
          data: null, isSuccess: false, errorMessage: 'Error en la solicitud.');
    }
  }
}
