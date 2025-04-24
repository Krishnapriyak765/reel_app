import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

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

  Future<void> handlePayment() async {
    try {
      setState(() => isLoading = true);

      // 1. Create billing details from user data
      final billingDetails = BillingDetails(
        name:
            "${widget.newsignupData['fname']} ${widget.newsignupData['lname']}",
        email: widget.newsignupData['email'],
        phone: widget.newsignupData['phone'],
      );
      print(billingDetails);
      // 2. Collect card details and create a secure PaymentMethod token
      final paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
          paymentMethodData: PaymentMethodData(
            billingDetails: BillingDetails(
              name:
                  "${widget.newsignupData['fname']} ${widget.newsignupData['lname']}",
              email: widget.newsignupData['email'],
              phone: widget.newsignupData['phone'],
            ),
          ),
        ),
      );

      // 3. Prepare the payload with Stripe token (secure!)
      final requestBody = {
        "fname": widget.newsignupData['fname'],
        "lname": widget.newsignupData['lname'],
        "email": widget.newsignupData['email'],
        "phone": widget.newsignupData['phone'],
        "age": widget.newsignupData['age'],
        "profession": widget.newsignupData['profession'],
        "residential_city": widget.newsignupData['residential_city'],
        "residential_country": widget.newsignupData['residential_country'],
        "pass": widget.newsignupData['pass'],
        "referral_code": widget.newsignupData['referral_code'],
        "stripe_token": paymentMethod.id, // ✅ SECURE
        "total_amount": 15.00,
      };
      print(requestBody);
      // 4. Send to backend
      final response = await http.post(
        Uri.parse('https://winngooreels.wimbgo.com/api/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        print(response.statusCode);
        showSuccessDialog("Payment successful & registration completed!");
      } else {
        showErrorDialog("Payment failed: ${response.body}");
        print(Error());
      }
    } catch (e) {
      print("$e");
      showErrorDialog("Payment error: $e");
    } finally {
      setState(() => isLoading = false);
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

  void showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Success"),
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
                        if (value == null || value.isEmpty) return 'Required';

                        // Regex: exactly 4 groups of 4 digits separated by space
                        final cardRegex = RegExp(r'^\d{4} \d{4} \d{4} \d{4}$');

                        if (!cardRegex.hasMatch(value)) {
                          return 'Enter a valid card number (xxxx xxxx xxxx xxxx)';
                        }

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
                        onPressed: isLoading ? null : handlePayment,
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
