import 'package:flutter/material.dart';
import '../utils/utils.dart';

class NetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  const NetworkImageWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl == ''
        ? Icon(
            Icons.image,
            color: Colors.grey,
            size: AppResizer.space90,
          )
        : Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (
              context,
              child,
              loadingProgress,
            ) =>
                loadingProgress == null
                    ? child
                    : Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
            errorBuilder: (
              context,
              error,
              stackTrace,
            ) =>
                Icon(
              Icons.image,
              color: Colors.grey,
              size: AppResizer.space90,
            ),
          );
  }
}
