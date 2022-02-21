import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:swp_direktdem_verf_app/service/model/address.dart';
import 'package:swp_direktdem_verf_app/service/model/appointment.dart';
import 'package:swp_direktdem_verf_app/service/service.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/map/map.dart';
import 'package:swp_direktdem_verf_app/widgets/map/point_of_interest.dart';
import 'package:tuple/tuple.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

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
    final List<Appointment> appointments =
        await Provider.of<Service>(context, listen: false)
            //TODO use passed ID when accessible
            .getAppointmentsFromProcedureId(1);
    final List<Tuple2<LatLng, PointOfInterest>> result =
        <Tuple2<LatLng, PointOfInterest>>[];
    // to prevent asynchronous gaps
    if (!mounted) {
      return result;
    }
    for (final Appointment appointment in appointments) {
      final Address address = await Provider.of<Service>(context, listen: false)
          .getAddressFromId(appointment.address_id!);
      final Location location = await locationFromAddress(
        '${address.street} ${address.house_number}, ${address.postcode}, ${address.city}, ${address.state}',
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
    return result;
    //return MockedSelectedProcedureService.pointsOfInterestList;
  }
}

class MapTile extends StatelessWidget {
  const MapTile();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Karte', style: Theme.of(context).textTheme.headline6),
      trailing: Icon(
        Icons.map_outlined,
        color: Theme.of(context).iconTheme.color,
      ),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const MapPage()),
      ),
    );
  }
}
