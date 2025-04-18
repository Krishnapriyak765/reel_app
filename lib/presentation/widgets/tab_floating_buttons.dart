import 'package:flutter/material.dart';
import 'package:winngoo_reels_app/main.dart';

class TabFloatingButtons extends StatelessWidget {
  final buttonStyle = ElevatedButton.styleFrom(
    minimumSize: Size(double.infinity, 45),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: Color(0xFF193A84),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: screenHeight * 0.2,
        child: Row(
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Contact Details"),
                  style: buttonStyle,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Upcoming Events"),
                  style: buttonStyle,
                ),

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Venue"),
                  style: buttonStyle,
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Enter Now"),
                  style: buttonStyle,
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
