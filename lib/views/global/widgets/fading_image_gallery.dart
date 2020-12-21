import 'dart:async';

import 'package:authentication/data/models/fading_image.dart';
import 'package:flutter/material.dart';

class FadingImageGallery extends StatefulWidget {
  FadingImageGallery({
    @required this.images,
    this.width = double.infinity,
    this.height = double.infinity,
  });

  final double width;
  final double height;
  final List<FadingImage> images;

  @override
  _FadingImageGalleryState createState() => _FadingImageGalleryState();
}

class _FadingImageGalleryState extends State<FadingImageGallery> {
  Timer fadeTimer;
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();

    startTimer();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (int i = 0; i < widget.images.length; i++)
          AnimatedOpacity(
            duration: Duration(seconds: 1),
            onEnd: () {
              fadeTimer.cancel();
              startTimer();
            },
            opacity: widget.images[i].isVisible ? 1.0 : 0.0,
            child: Image.asset(
              widget.images[i].asset,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            ),
          ),
      ],
    );
  }

  void startTimer() {
    fadeTimer = Timer(Duration(seconds: 3), () {
      int nextIndex = (currentImageIndex + 1) % widget.images.length;
      setState(() {
        widget.images[currentImageIndex].isVisible = false;
        widget.images[nextIndex].isVisible = true;
      });
      currentImageIndex = nextIndex;
    });
  }
}
