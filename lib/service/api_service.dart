import "package:http/http.dart" as http;

class ApiService {
  Future<void> fetchData() async {
    print("Fetching data...");
    final response = await http.get(
      Uri.parse("http://192.168.1.219:3000/helo")
    );
    print(response.body);
  }
}