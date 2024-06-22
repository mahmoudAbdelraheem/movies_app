import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/apis_config.dart';
import 'package:shimmer/shimmer.dart';

class MovieImage extends StatelessWidget {
  final String imagePath;
  const MovieImage({
    super.key,
    required this.imagePath,
  });



  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        width: 130.0,
        height: 240,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: CachedNetworkImage(
          width: 120.0,
          height: 250,
          fit: BoxFit.cover,
          imageUrl: ApisConfig.imageUrl(imagePath),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
