```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrect data handling: Assuming a simple JSON structure without checking.
      final data = jsonDecode(response.body) as Map<String, dynamic>; 
      print(data['value']); // Potential error if 'value' key is missing
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e'); // Missing specific error handling
  }
}
```