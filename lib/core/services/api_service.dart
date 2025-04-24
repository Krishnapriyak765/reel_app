// Example API service setup (Dio or HTTP)
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> registerUser({
  required String fname,
  required String lname,
  required String email,
  required String phone,
  required int age,
  required String profession,
  required String residentialCity,
  required String residentialCountry,
  required String password,
  required String referralCode,
  required String stripeToken,
  required double totalAmount,
  required String bearerToken,
}) async {
  final url = Uri.parse('register');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $bearerToken',
    },
    body: jsonEncode({
      "fname": fname,
      "lname": lname,
      "email": email,
      "phone": phone,
      "age": age,
      "profession": profession,
      "residential_city": residentialCity,
      "residential_country": residentialCountry,
      "pass": password,
      "referral_code": referralCode,
      "stripe_token": stripeToken,
      "total_amount": totalAmount,
    }),
  );

  return response;
}
