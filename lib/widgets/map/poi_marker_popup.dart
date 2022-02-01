import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/map/point_of_interest.dart';

class POIMarkerPopup extends StatelessWidget {
  const POIMarkerPopup({Key? key, required this.location}) : super(key: key);

  final PointOfInterest location;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Card(
          color: Theme.of(context).colorScheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Ort: ${location.location}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
