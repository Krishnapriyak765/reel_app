import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/password/new_password.dart';

class Forgetpw extends StatefulWidget {
  const Forgetpw({Key? key}) : super(key: key);

  @override
  State<Forgetpw> createState() => _ForgetpwState();
}

class _ForgetpwState extends State<Forgetpw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/fpw.jpeg')),
            SizedBox(height: 25),
            Text(
              "Email",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Please enter the email associated with your account.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            TextFormField(
              validator: (forgotpw) {
                if (forgotpw == null || forgotpw.isEmpty) {
                  return "The field is empty";
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                ).hasMatch(forgotpw)) {
                  return "Enter a valid email";
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: "winngoo29@gmail.com",
              ),
            ),
            SizedBox(height: 25),
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
                    MaterialPageRoute(builder: (context) => Createnewpw()),
                  );
                  // }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: const Text(
                    "Send password Reset Link",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
