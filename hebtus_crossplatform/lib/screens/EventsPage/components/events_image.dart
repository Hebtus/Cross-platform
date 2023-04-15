import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hebtus_crossplatform/globals/globals.dart';
import 'package:hebtus_crossplatform/models/attendee_event.dart';

DecorationImage EventImage(BuildContext context, AttendeeEvent event) {
  return DecorationImage(
    image: NetworkImage(event.imgURL),
    fit: BoxFit.fitHeight,
  );
}
