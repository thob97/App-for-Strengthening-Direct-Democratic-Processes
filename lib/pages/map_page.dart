import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:swp_direktdem_verf_app/service/model/address.dart';
import 'package:swp_direktdem_verf_app/service/model/appointment.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/detailed_procedure.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/map/map.dart';
import 'package:swp_direktdem_verf_app/widgets/map/point_of_interest.dart';
import 'package:tuple/tuple.dart';

class MapPage extends StatefulWidget {
  const MapPage(this.procedure, {Key? key}) : super(key: key);

  final DetailedProcedure procedure;

  @override
  State<StatefulWidget> createState() {
    return _MapPageState();
  }
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Karte'),
      body: Center(
        child: FutureBuilder<List<Tuple2<LatLng, PointOfInterest>>>(
          future: getPointsOfInterest(context),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Tuple2<LatLng, PointOfInterest>>> snapshot,
          ) {
            return MapView(
              pointsOfInterestList: snapshot.data,
            );
          },
        ),
      ),
    );
  }

  Future<List<Tuple2<LatLng, PointOfInterest>>> getPointsOfInterest(
    BuildContext context,
  ) async {
    final List<Appointment> appointments = widget.procedure.appointments;
    final List<Tuple2<LatLng, PointOfInterest>> result =
        <Tuple2<LatLng, PointOfInterest>>[];
    for (final Appointment appointment in appointments) {
      final Address? address = appointment.address;
      if (address != null) {
        final Location location = await locationFromAddress(
          '${address.street} ${address.houseNumber}, ${address.postcode}, ${address.city}, ${address.state}',
        ).then((locations) => locations.first);
        result.add(
          Tuple2(
            LatLng(location.latitude, location.longitude),
            PointOfInterest(
              appointment: appointment,
              address: address,
            ),
          ),
        );
      }
    }
    return result;
  }
}

class MapTile extends StatelessWidget {
  const MapTile({required this.procedure});

  final DetailedProcedure procedure;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Karte', style: Theme.of(context).textTheme.headline6),
      trailing: Icon(
        Icons.map_outlined,
        color: Theme.of(context).iconTheme.color,
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => MapPage(procedure)),
      ),
    );
  }
}
