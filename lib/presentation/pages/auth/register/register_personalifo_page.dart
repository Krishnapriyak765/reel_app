import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/register_payment_page.dart';

class PersonalInfoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Personal information',
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
              color: Color(0xff2b21f3),
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {}, // Handle back action
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField(label: 'First name', hint: 'Winngoo'),
                  buildTextField(label: 'Last name', hint: 'consultancy'),
                  buildTextField(
                    label: 'Age',
                    hint: '18',
                    keyboardType: TextInputType.number,
                  ),
                  buildTextField(
                    label: 'Phone number',
                    hint: '9656895651',
                    keyboardType: TextInputType.phone,
                  ),
                  buildTextField(label: 'Residential city', hint: 'Chennai'),
                  buildTextField(label: 'Profession', hint: 'Manager'),
                  buildTextField(label: 'Country', hint: 'UK'),
                  SizedBox(height: 20),
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
                            builder: (context) => PaymentDetailsPage(),
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
                          "Next",
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

  Widget buildTextField({
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              // labelText: label,
              hintText: hint,
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
