import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? color;
  final double? width;
  final double? height;
  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppResizer.space130,
      height: height ?? AppResizer.space40,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all<Color>(color ?? Color(0xffc61f27)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
