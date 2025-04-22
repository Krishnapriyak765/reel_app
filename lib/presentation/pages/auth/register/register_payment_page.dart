import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:winngoo_reels_app/presentation/pages/auth/login/login_page.dart';

class PaymentDetailsPage extends StatefulWidget {
  final Map<String, dynamic> newsignupData;

  const PaymentDetailsPage({super.key, required this.newsignupData});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  // final _storage = GetStorage();
  // final calldata = si;

  final _cardNumberController = TextEditingController();
  final _cvvController = TextEditingController();
  final _holderNameController = TextEditingController();
  final _expiryController = TextEditingController();

  bool isLoading = false;

  Future<void> onNextPressed() async {
    if (!_formKey.currentState!.validate()) return;
    // print(calldata);
    final signuprecord = widget.newsignupData;
    print(signuprecord);

    setState(() => isLoading = true);

    final url = Uri.parse('https://winngooreels.wimbgo.com/api/register');
    final headers = {'Content-Type': 'application/json'};

    final body = jsonEncode({
      "fname": signuprecord['fname'],
      "lname": signuprecord['lname'],
      "email": signuprecord['email'],
      "phone": signuprecord['phone'],
      "age": signuprecord['age'],
      "profession": signuprecord['profession'],
      "residential_city": signuprecord['residential_city'],
      "residential_country": signuprecord['residential_country'],
      "pass": signuprecord['pass'],
      "referral_code": signuprecord['referral_code'],
      "stripe_token": "tok_visa",
      "total_amount": 15.0,
    });
    print(body);
    try {
      final response = await http.post(url, headers: headers, body: body);
      final responseData = jsonDecode(response.body);

      setState(() => isLoading = false);

      if (response.statusCode == 201 && responseData['success'] == true) {
        print('Signup successful: $responseData');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginPage()),
        );
      } else {
        showErrorDialog(responseData['message'] ?? 'Registration failed.');
      }
    } catch (e) {
      setState(() => isLoading = false);
      showErrorDialog("An error occurred. Please check your internet.");
      print('Error: $e');
    }
  }

  void showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Error"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Payment Details',
            style: TextStyle(
              color: Color(0xff2b21f3),
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildInfoRow('Business Type', 'Winngoo reels competition'),
                    buildDivider(),
                    buildInfoRow('Currency', 'GBP'),
                    buildDivider(),
                    buildInfoRow(
                      'Order Description',
                      'Order for getting Winngoo reels Membership',
                    ),
                    buildDivider(),
                    buildInfoRow(
                      'Payment Amount',
                      '£15',
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Credit/ Debit Card',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Add and secure cards as per RBI guidelines',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    SizedBox(height: 10),
                    buildTextField(
                      controller: _holderNameController,
                      label: 'A/c Holder Name *',
                      hint: 'Enter holder name',
                      validator: (value) => value!.isEmpty ? 'Required' : null,
                    ),
                    buildTextField(
                      controller: _cardNumberController,
                      label: 'Card Number *',
                      hint: 'XXXX XXXX XXXX XXXX',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) return 'Required';
                        if (value.length < 16) return 'Invalid card number';
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                            controller: _expiryController,
                            label: 'Valid Thru *',
                            hint: 'MM/YY',
                            validator: (value) {
                              if (value!.isEmpty) return 'Required';
                              if (!RegExp(
                                r"^(0[1-9]|1[0-2])\/\d{2}$",
                              ).hasMatch(value)) {
                                return 'Invalid expiry';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: buildTextField(
                            controller: _cvvController,
                            label: 'CVV *',
                            hint: 'CVV',
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value!.isEmpty) return 'Required';
                              if (value.length != 3) return 'Invalid CVV';
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Color(0xff2b21f3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: isLoading ? null : onNextPressed,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 99,
                            vertical: 15,
                          ),
                          child: Text(
                            "Pay Now",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            if (isLoading)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    String? hint,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    required FormFieldValidator<String> validator,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
        ),
        validator: validator,
      ),
    );
  }

  Widget buildInfoRow(
    String title,
    String value, {
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(child: Text(title, style: TextStyle(fontSize: 16))),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16,
                color: color,
                fontWeight: fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() => Divider(thickness: 1, height: 24);
}
