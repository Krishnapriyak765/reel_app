import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/register_personalifo_page.dart';

class PaymentDetailsPage extends StatefulWidget {
  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final _formKey = GlobalKey<FormState>();

  // final _holderNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  // final _expiryController = TextEditingController();
  final _cvvController = TextEditingController();

  final signupData = {
    // 'name': '',
    'stripe_token': '',
    // 'password': '',
    'total_amount': '',
  };

  // Step 2: Function to handle next button press
  void onNextPressed() {
    if (_formKey.currentState!.validate()) {
      // signupData['cardHolderName'] = _holderNameController.text.trim();
      signupData['stripe_token'] = _cardNumberController.text.trim();
      // signupData['empiry'] = _expiryController.text.trim();
      signupData['total_amount'] = _cvvController.text.trim();

      // Navigate to PersonalInfoForm and pass signup data

      context.pushNamed('login');
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (_) => PersonalInfoForm(signupData: signupData),
      //   ),
      // );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields correctly.")),
      );
    }
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildInfoRow('Business Type', 'Winngoo reels competition'),
                  buildDivider(),
                  buildInfoRow('Currency', 'GBP'),
                  buildDivider(),
                  buildInfoRow(
                    'Order Descriptions',
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Add and secure cards as per RBI guidelines',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 10),

                  // --- Native TextFormFields Below ---
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      // controller: _holderNameController,
                      decoration: InputDecoration(
                        labelText: 'A/c Holder Name *',
                        hintText: 'Enter holder name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) => value!.isEmpty ? 'Required' : null,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: _cardNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Card Number *',
                        hintText: 'XXXX XXXX XXXX',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) return 'Required';
                        if (value.length != 16) return 'Invalid card number';
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            // controller: _expiryController,
                            decoration: InputDecoration(
                              labelText: 'Valid Thru *',
                              hintText: 'MM/YY',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) return 'Required';
                              if (!RegExp(
                                r"^(0[1-9]|1[0-2])\/\d{2}$",
                              ).hasMatch(value)) {
                                return 'Invalid expiry date';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: TextFormField(
                            controller: _cvvController,
                            obscureText: true,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'CVV *',
                              hintText: 'CVV',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) return 'Required';
                              if (value.length != 3) return 'Invalid CVV';
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xff2b21f3),
                      ),
                      onPressed: () {
                        onNextPressed(); // Call onNextPressed method here
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 99,
                          vertical: 15,
                        ),
                        child: const Text(
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
        ),
      ),
    );
  }

  Widget buildInfoRow(
    String title,
    String value, {
    Color color = Colors.green,
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
