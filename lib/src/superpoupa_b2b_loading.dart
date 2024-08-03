import 'package:flutter/material.dart';

class SuperPoupaB2BLoading extends StatelessWidget {
  const SuperPoupaB2BLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 180,
        height: 180,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  color: Colors.orange[700],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '\$',
                style: TextStyle(
                  color: Colors.orange[700],
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
