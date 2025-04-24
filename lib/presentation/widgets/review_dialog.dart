import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:winngoo_reels_app/core/constants/app_colors.dart';

class ReviewDialog extends StatefulWidget {
  final VoidCallback onClose;
  final String token;

  const ReviewDialog({super.key, required this.onClose, required this.token});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  double rating = 0;
  final TextEditingController _commentController = TextEditingController();
  bool isSubmitting = false;

  Future<void> submitReview() async {
    setState(() => isSubmitting = true);
    final url = Uri.parse('https://winngooreels.wimbgo.com/api/user/reviews');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${widget.token}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'rating': rating.round(),
        'review': _commentController.text,
      }),
    );

    setState(() => isSubmitting = false);

    if (response.statusCode == 200) {
      Navigator.pop(context);
      widget.onClose();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Thank you for your feedback!")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to submit review")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.all(16),
        color: Color(0xFF82AFFF),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Leave Your Review",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Appcolors.white,
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.close), onPressed: widget.onClose),
              ],
            ),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              allowHalfRating: false,
              itemCount: 5,
              itemBuilder:
                  (context, _) => Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (r) => setState(() => rating = r),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Leave Your Comment",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: Appcolors.white,
                ),
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _commentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Type here...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolors.secondaryYellow,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              onPressed: isSubmitting ? null : submitReview,
              child: Text(
                isSubmitting ? "Submitting..." : "Submit",
                style: GoogleFonts.inter(
                  color: Appcolors.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
