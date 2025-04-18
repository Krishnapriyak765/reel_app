import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/animation.dart';

class PaymentDetailsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
            onPressed: () {}, // Handle back
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
                  buildInfoRow('Currency', 'GPB'),
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
                  buildTextField(
                    label: 'A/c Holder Name',
                    hint: 'Enter holder name',
                    isRequired: true,
                  ),
                  buildTextField(
                    label: 'Card Number',
                    hint: 'XXXX XXXX XXXX',
                    isRequired: true,
                    keyboardType: TextInputType.number,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: buildTextField(
                          label: 'Valid Thru',
                          hint: 'MM/YY',
                          isRequired: true,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: buildTextField(
                          label: 'CVV',
                          hint: 'CVV',
                          isRequired: true,
                          obscureText: true,
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
                        // shape: BoxBorder(),
                        // minimumSize: const Size(double.infinity, 48),
                        backgroundColor: Color(0xff2b21f3),
                      ),
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        // TODO: Add login logic (API call or local check)
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Animationscreen(),
                          ),
                        );
                        // }
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

  Widget buildTextField({
    required String label,
    required String hint,
    bool isRequired = false,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator:
            isRequired ? (value) => value!.isEmpty ? 'Required' : null : null,
        decoration: InputDecoration(
          labelText: label + (isRequired ? ' *' : ''),
          hintText: hint,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
