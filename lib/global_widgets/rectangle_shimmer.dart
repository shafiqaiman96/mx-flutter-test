import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/utils.dart';

class RectangleShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double? radius;
  const RectangleShimmer({
    super.key,
    required this.width,
    required this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white.withOpacity(.5),
      period: const Duration(milliseconds: 1000),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.8),
          borderRadius: BorderRadius.circular(
            radius ?? AppResizer.space10,
          ),
        ),
      ),
    );
  }
}
