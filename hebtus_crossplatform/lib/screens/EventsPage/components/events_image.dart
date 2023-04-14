import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';

DecorationImage EventImage(BuildContext context) {
  if (ad != null) {
    return DecorationImage(
      image: NetworkImage(ad!.imgURL),
      fit: BoxFit.fitHeight,
    );
  }
  return DecorationImage(image: NetworkImage(""));
}
