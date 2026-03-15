import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PinchZoomOverlay extends StatelessWidget {
  final String imageUrl;

  const PinchZoomOverlay({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      minScale: 1.0,
      maxScale: 4.0,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}