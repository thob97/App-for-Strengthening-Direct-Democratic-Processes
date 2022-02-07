import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:swp_direktdem_verf_app/widgets/map/point_of_interest.dart';

class PopupPOIMarker extends Marker {
  PopupPOIMarker({
    required LatLng point,
    required WidgetBuilder builder,
    Key? key,
    double width = 30.0,
    double height = 30.0,
    bool? rotate,
    Offset? rotateOrigin,
    AlignmentGeometry? rotateAlignment,
    AnchorPos? anchorPos,
    required this.location,
  }) : super(
          point: point,
          builder: builder,
          key: key,
          width: width,
          height: height,
          rotate: rotate,
          rotateOrigin: rotateOrigin,
          rotateAlignment: rotateAlignment,
          anchorPos: anchorPos,
        );

  final PointOfInterest location;
}
