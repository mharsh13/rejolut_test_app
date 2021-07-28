import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    Key? key,
    required this.photoUrl,
    required this.theme,
  }) : super(key: key);

  final String? photoUrl;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        photoUrl!,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              color: theme.accentColor,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      num.parse(loadingProgress.expectedTotalBytes.toString())
                  : null,
            ),
          );
        },
      ),
    );
  }
}
