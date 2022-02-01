import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:swp_direktdem_verf_app/widgets/map/poi_marker_popup.dart';
import 'package:swp_direktdem_verf_app/widgets/map/point_of_interest.dart';
import 'package:swp_direktdem_verf_app/widgets/map/popup_poi_marker.dart';
import 'package:tuple/tuple.dart';

class MapView extends StatelessWidget {
  const MapView({required this.pointsOfInterestList});

  final List<Tuple2<LatLng, PointOfInterest>> pointsOfInterestList;

  PopupController get popupController => PopupController();

  @override
  Widget build(BuildContext context) {
    final List<Marker> markers = pointsOfInterestList
        .map(
          (entry) => PopupPOIMarker(
            point: entry.item1,
            builder: (context) => entry.item2.icon!,
            location: PointOfInterest(
              location: entry.item2.location,
            ),
          ),
        )
        .toList();

    return FlutterMap(
      options: MapOptions(
        center: LatLng(52.5, 13.4),
        zoom: 10,
        onTap: (_, LatLng latLng) => popupController.hideAllPopups(),
      ),
      children: <Widget>[
        TileLayerWidget(
          options: TileLayerOptions(
            minZoom: 1,
            maxZoom: 19,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            retinaMode: true,
            attributionBuilder: (_) {
              return const Text('© OpenStreetMap contributors');
            },
          ),
        ),
        PopupMarkerLayerWidget(
          options: PopupMarkerLayerOptions(
            markers: markers,
            popupController: popupController,
            popupBuilder: (_, Marker marker) {
              if (marker is PopupPOIMarker) {
                return POIMarkerPopup(
                  location: marker.location,
                );
              }
              return Card(
                child: Text(
                  'Lat: ${marker.point.latitude}, Long: ${marker.point.longitude}',
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
