import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon(
      this.url, {
        Key? key,
        this.size = 80,
      }) : super(key: key);

  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: size,
      height: size,
      fit: BoxFit.fill,
      imageUrl: 'https:$url',
    );
  }
}
