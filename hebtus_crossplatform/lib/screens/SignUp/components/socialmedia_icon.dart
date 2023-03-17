import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaIcon extends StatelessWidget {
  final String iconSource;
  final VoidCallback press;
  const SocialMediaIcon({
    super.key,
    required this.iconSource,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: SvgPicture.asset(iconSource),
      ),
    );
  }
}
