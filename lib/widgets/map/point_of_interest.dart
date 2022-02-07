import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/map/signature_icon_icons.dart';

class PointOfInterest {
  const PointOfInterest({
    required this.location,
    this.icon = const Icon(
      SignatureIcon.fileSignature,
      size: 30,
      color: Color(0xFF194C76),
    ),
  });

  final String location;
  final Icon? icon;
}
