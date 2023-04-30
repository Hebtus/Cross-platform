import 'package:flutter/material.dart';
import 'package:hebtus_crossplatform/components/socialmedia_icon.dart';

import 'stub.dart';

/// Renders a SIGN IN button that calls `handleSignIn` onclick.
Widget buildSignInButton({HandleSignInFn? onPressed}) {
  return SocialMediaIcon(
      iconSource: "assets/icons/google.svg", press: onPressed);
}
