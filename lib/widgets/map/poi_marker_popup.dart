import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:swp_direktdem_verf_app/widgets/map/point_of_interest.dart';

class POIMarkerPopup extends StatelessWidget {
  const POIMarkerPopup({Key? key, required this.pointOfInterest})
      : super(key: key);

  final PointOfInterest pointOfInterest;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('dd.MM.yyyy kk:mm');
    String popupText =
        '\nBeschreibung:\n  ${pointOfInterest.appointment.description}';
    if (pointOfInterest.appointment.begin != null &&
        pointOfInterest.appointment.end != null) {
      popupText += '\n\nZeitraum:\n  von ${formatter.format(
        pointOfInterest.appointment.begin!,
      )} Uhr\n  bis ${formatter.format(
        pointOfInterest.appointment.end!,
      )} Uhr';
    }
    popupText +=
        '\n\nAddresse:\n  ${pointOfInterest.address.street} ${pointOfInterest.address.houseNumber}\n  ${pointOfInterest.address.postcode} ${pointOfInterest.address.city}';
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              // has to remain
              pointOfInterest.appointment.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              // has to remain
              popupText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
