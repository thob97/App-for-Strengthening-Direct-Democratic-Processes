import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/service/model/address.dart';
import 'package:swp_direktdem_verf_app/service/model/appointment.dart';
import 'package:swp_direktdem_verf_app/widgets/map/signature_icon_icons.dart';

class PointOfInterest {
  const PointOfInterest({
    required this.appointment,
    required this.address,
    this.icon = const Icon(
      SignatureIcon.fileSignature,
      size: 30,
      color: Color(0xFF194C76),
    ),
  });

  final Appointment appointment;
  final Address address;
  final Icon? icon;
}
