import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///the icon which displays a circular icon for the google/facebook login and sign up option
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
