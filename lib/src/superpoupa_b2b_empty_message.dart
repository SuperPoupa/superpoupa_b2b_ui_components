import 'package:flutter/material.dart';

class SuperPoupaB2BEmptyMessage extends StatelessWidget {
  final String label;
  final IconData icon;
  const SuperPoupaB2BEmptyMessage({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(padding: const EdgeInsets.only(bottom: 16), child: Icon(icon, size: 100, color: Colors.grey[300])),
            Text(label, style: TextStyle(color: Colors.grey[300]), textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}