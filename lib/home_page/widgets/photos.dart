import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  const Photos({
    required this.photos,
    super.key,
  });

  final List<String> photos;

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        for (int i = 0; i < widget.photos.length; i++)
          CachedNetworkImage(
            imageUrl: widget.photos[i],
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,

                ),
              ),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 20,
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
      ],
    );
  }
}
