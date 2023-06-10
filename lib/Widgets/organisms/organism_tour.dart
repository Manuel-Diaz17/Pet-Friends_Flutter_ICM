import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:pedometer/pedometer.dart';
import 'package:pet_sitting_project/Constants/constant_routes.dart';

class OrganismTour extends StatefulWidget {
  const OrganismTour({super.key});

  @override
  State<OrganismTour> createState() => _OrganismTourState();
}

class _OrganismTourState extends State<OrganismTour> {
  final Completer<GoogleMapController> _controller = Completer();

  //static const LatLng currentLocation1 = LatLng(37.33500926, -122.03272188);

  LocationData? currentLocation;

  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async{
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      }, 
    );

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 16,
            target: LatLng(
            newLoc.latitude!, 
            newLoc.longitude!,))));

      setState(() {});
     }
    );

  }

  void setCustomMarkerIcon(){
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty, "assets/images/pet_icon.png")
      .then((icon) => currentLocationIcon = icon);
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    setCustomMarkerIcon();
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null)
      return Center(child: CircularProgressIndicator(),);

    return Column(
      children: [
        Container(
          height: 600,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
              //target: currentLocation1,
              zoom: 16,
            ),
            markers: {
              Marker(
                markerId: MarkerId("currentLocation"),
                icon: currentLocationIcon,
                position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                //position: currentLocation1
              )
            },
            onMapCreated: (mapController){
              _controller.complete(mapController);
            },
          ),
        ),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, ConstantRoutes.logged);
              },
              icon: Icon(Icons.stop), 
              label: Text("Finish")
            )
          ],
        )
      ],

    );
  }
}