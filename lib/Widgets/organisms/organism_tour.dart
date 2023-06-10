import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class OrganismTour extends StatefulWidget {
  const OrganismTour({super.key});

  @override
  State<OrganismTour> createState() => _OrganismTourState();
}

class _OrganismTourState extends State<OrganismTour> {
  final Completer<GoogleMapController> _controller = Completer();

  //static const LatLng currentLocation = LatLng(0, 0);

  LocationData? currentLocation;

  void getCurrentLocation(){
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      }, 
    );
  }

  @override
  void initState() {
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        currentLocation == null ? const Center(child: Text("Loading")):
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            zoom: 13.5,
          ),
          markers: {
            Marker(markerId: const MarkerId("currentLocation"),
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            )
          },
        )
      ],
    );
  }
}