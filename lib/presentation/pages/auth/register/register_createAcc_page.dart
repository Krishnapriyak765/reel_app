import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/login/login_page.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/register_personalifo_page.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Join now and dive into a world of endless reels and creativity',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 30),
                buildTextField("Name", 'Winngoo'),
                buildTextField("Email", 'Winngooconsultancy.in'),
                buildPasswordField(
                  "Password",
                  'SS@12344',
                  _obscurePassword,
                  () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                Text(
                  'Use 8+ characters with a mix of letters, numbers & symbols (!@#%)',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
                buildPasswordField(
                  "Confirm Password",
                  '**********',
                  _obscureConfirm,
                  () {
                    setState(() {
                      _obscureConfirm = !_obscureConfirm;
                    });
                  },
                ),
                buildTextField("Referral Code", 'Winngooreels-799739'),
                Row(
                  children: [
                    Checkbox(
                      value: _agree,
                      onChanged: (value) => setState(() => _agree = value!),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: 'I agree to the '),
                            TextSpan(
                              text: 'Terms & Conditions',
                              style: TextStyle(color: Colors.blue),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                          builder: (context) => PersonalInfoForm(),
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an Account ? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        "  Sign in",
                        style: TextStyle(
                          color: Color(0xff2b21f3),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String title, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
              // labelText: label,
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPasswordField(
    String title,
    String hint,
    bool obscure,
    VoidCallback toggleVisibility,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            obscureText: obscure,
            decoration: InputDecoration(
              // labelText: label,
              hintText: hint,
              suffixIcon: IconButton(
                icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                onPressed: toggleVisibility,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
