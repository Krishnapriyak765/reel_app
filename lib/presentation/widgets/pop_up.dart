import 'package:flutter/material.dart';

class InfoPopupCard extends StatelessWidget {
  final List<Widget> children;

  const InfoPopupCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: children),
      ),
    );
  }
}
