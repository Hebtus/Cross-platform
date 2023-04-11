import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

DecorationImage EventImage(BuildContext context) {
  
  return  const DecorationImage(
    image: NetworkImage("https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F488431879%2F1238997120003%2F1%2Foriginal.20230409-012252?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=10%2C0%2C580%2C290&s=00b9593f0d2fa626a36f0ae6015d6164"
    ),
    fit: BoxFit.fitHeight,
    
  );
}
