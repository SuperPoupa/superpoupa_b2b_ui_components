import 'package:flutter/material.dart';

class SuperPoupaB2BImage extends StatelessWidget {
  final double width;
  final double height;
  final String? imageUrl;
  final String? productEan;
  const SuperPoupaB2BImage({
    super.key,
    required this.width,
    required this.height,
    this.imageUrl,
    this.productEan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      child: imageUrl != null || productEan != null
      ? Image.network(
          imageUrl != null ? imageUrl! : 'https://cdn-cosmos.bluesoft.com.br/products/$productEan',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported_outlined),
        )
      : const Icon(Icons.image_not_supported_outlined),
    );
  }
}