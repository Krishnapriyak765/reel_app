import 'package:flutter/material.dart';

class TabHeaderBanner extends StatelessWidget {
  final String imagePath;
  final String startDate;
  final String endDate;

  const TabHeaderBanner({
    required this.imagePath,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 180,
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Start Date: $startDate",
                style: TextStyle(color: Colors.white),
              ),
              Text("End Date: $endDate", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
