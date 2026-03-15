import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PinchZoomOverlay extends StatefulWidget {
  final String imageUrl;

  const PinchZoomOverlay({super.key, required this.imageUrl});

  @override
  State<PinchZoomOverlay> createState() => _PinchZoomOverlayState();
}

class _PinchZoomOverlayState extends State<PinchZoomOverlay> {
  final TransformationController _controller = TransformationController();

  void _resetZoom() {
    _controller.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleEnd: (details) {
        _resetZoom(); // snap back when fingers released
      },
      child: InteractiveViewer(
        transformationController: _controller,
        minScale: 1,
        maxScale: 4,
        panEnabled: true,
        child: CachedNetworkImage(
          imageUrl: widget.imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}