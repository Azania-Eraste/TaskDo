import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  static const LatLng _center = LatLng(5.28, -3.5);
  static const LatLng destination = LatLng(5.28, 0.5);
  // LocationData? LocalisationActu;

  // void getLocation() {
  //   Location localisation = Location();

  //   localisation.getLocation().then((location) {
  //     LocalisationActu = location;
  //   });
  // }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<LatLng> Coordinates = [];

  void cheminEntrePoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyAd4rEAQqf58fCJGABqW99teDP9BcuyN08',
        PointLatLng(_center.latitude, _center.longitude),
        PointLatLng(destination.latitude, destination.longitude));

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng points) =>
          Coordinates.add(LatLng(points.latitude, points.longitude)));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // LocalisationActu == null
        //     ? const Center(
        //         child: Text('Loading'),
        //       )
        //     :
        GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      polylines: {
        Polyline(polylineId: const PolylineId("route"), points: Coordinates)
      },
      markers: {
        const Marker(
          markerId: MarkerId("Position"),
          position: _center,
          infoWindow: InfoWindow(
            title: "Sydney",
            snippet: "Capital of New South Wales",
          ),
        ),
        const Marker(markerId: MarkerId('Destination'), position: destination)
      },
    );
  }
}
