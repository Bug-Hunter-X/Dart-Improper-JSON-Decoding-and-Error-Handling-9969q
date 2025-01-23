```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        if (jsonData is Map && jsonData.containsKey('value')) {
          print(jsonData['value']);
        } else {
          print('Error: JSON data is not a map or missing the "value" key.');
        }
      } on FormatException catch (e) {
        print('Error: Invalid JSON format: $e');
      } catch (e) {
        print('Error: An unexpected error occurred during JSON processing: $e');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e'); // More specific error handling could be added here.
  }
}
```