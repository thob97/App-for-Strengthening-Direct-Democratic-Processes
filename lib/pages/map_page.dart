import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/mocked_data/mocked_selected_procedure_service.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';
import 'package:swp_direktdem_verf_app/widgets/map/map.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Karte'),
      body: Center(
        // insert map
        child: MapView(
          pointsOfInterestList:
              MockedSelectedProcedureService.pointsOfInterestList,
        ),
      ),
    );
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
