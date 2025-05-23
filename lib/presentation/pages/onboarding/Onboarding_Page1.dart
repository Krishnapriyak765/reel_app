import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/presentation/pages/onboarding/Onboarding_Page2.dart';
import 'package:winngoo_reels_app/presentation/pages/onboarding/Onboarding_Page3.dart';
import 'package:winngoo_reels_app/presentation/widgets/image_animation.dart';

// void main() {
//   runApp(MaterialApp(
//     home: OnboardingPage(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Back arrow
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.arrow_back),
              ),

              // Illustration
              DancingImagePage(val: 1),

              // Page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_dot(true), _dot(false), _dot(false)],
              ),

              // Text Content
              Column(
                children: [
                  Text(
                    "Lights, Camera, Action",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Swipe, Create, And Vibe With Endless Short Videos! Let’s Get Started",
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // Buttons (Skip + Next)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReelFunPage()),
                      );
                    },
                    child: Text("Skip"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xff2b21f3),
                      side: BorderSide(color: Color(0xff2b21f3)),
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Onboarding()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff2b21f3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(14),
                    ),
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}
