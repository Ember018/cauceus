import 'dart:convert'; // For jsonDecode and jsonEncode
import 'package:http/http.dart' as http;

class AuthApiService {
  final String _baseUrl = "http://127.0.0.1:8000/";

  Future<Map<String, dynamic>> login(String username, String password) async {
    // Construct the full URL
    final Uri loginUrl = Uri.parse('$_baseUrl/users/api/login/');

    try {
      final response = await http.post(
        loginUrl,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          // Encode username/password as JSON
          'username': username,
          'password': password,
        }),
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Success: Decode the JSON body and return it
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print('API Service Success: $responseData'); // For debugging
        return responseData;
      } else {
        print(
            'API Service Error: ${response.statusCode} Body: ${response.body}');
        String errorMessage =
            'Login failed with status code: ${response.statusCode}';
        try {
          final errorData = jsonDecode(response.body);
          errorMessage = errorData['detail'] ?? errorData.toString();
        } catch (_) {
          errorMessage =
              'Login failed: ${response.reasonPhrase} (${response.statusCode})';
        }
        throw Exception(errorMessage);
      }
    } catch (e) {
      print('API Service Network/Other Error: $e');
      throw Exception(
          'Failed to connect to the server. Please check your connection. ($e)');
    }
  }
}
