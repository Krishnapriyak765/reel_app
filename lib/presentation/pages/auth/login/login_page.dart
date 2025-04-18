import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/password/forgot_password.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/provider.dart';
import 'package:winngoo_reels_app/presentation/pages/auth/register/register_createAcc_page.dart';
import 'package:winngoo_reels_app/presentation/pages/dashboard/home/profile_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Image.asset('assets/images/login.png', height: 220),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Welcome back",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff2b21f3),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Welcome back! Log in to dive into endless reels",
                  style: TextStyle(
                    fontSize: 14,
                    // color: Color(0xff2b21f3),
                    // ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return "Please enter your email";
                    }
                    if (!RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}',
                    ).hasMatch(email)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "Winngooconsultancy.in",
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return "Please enter your password";
                    }
                    if (password.length < 8) {
                      return "Password must be at least 8 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "********",
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: loginProvider.rememberMe,
                      onChanged: (value) {
                        if (value != null) {
                          loginProvider.toggleRememberMe(value);
                        }
                      },
                    ),
                    const Text("Remember me?"),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forgetpw()),
                        );
                      },
                      child: const Text("Forgot password?"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                          builder: (context) => MembershipInfoPage(),
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
                        "Sign in",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an Account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateAccountPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "  Sign up",
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
}
