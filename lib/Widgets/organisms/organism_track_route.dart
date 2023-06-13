import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:pet_sitting_project/Constants/constant_routes.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:pet_sitting_project/Constants/constants.dart';
import 'dart:math';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart' as location;

import 'package:pet_sitting_project/Constants/constants_colors.dart';

class OrganismTrackRoute extends StatefulWidget {
  const OrganismTrackRoute({Key? key}) : super(key: key);

  @override
  State<OrganismTrackRoute> createState() => _OrganismTrackRouteState();
}

class _OrganismTrackRouteState extends State<OrganismTrackRoute> {
  final Completer<GoogleMapController> _controller = Completer();

  location.LocationData? currentLocation;
  //static const LatLng petLocation = LatLng(40.6412, -8.65362);
  String cityName = "Águeda"; // Update with your desired city name

  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor petLocationIcon = BitmapDescriptor.defaultMarker;

  List<LatLng> polylineCoordinates = [];

  double distance = 0.0;

  void getCurrentLocation() async {
    location.Location _location = location.Location();

    _location.getLocation().then(
      (location) {
        setState(() {
          currentLocation = location;
          getPolyPoints();
          updateDistance();
        });
      },
    );

    GoogleMapController googleMapController = await _controller.future;

    _location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;

      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 14.5,
            target: LatLng(
              newLoc.latitude!,
              newLoc.longitude!,
            ),
          ),
        ),
      );

      setState(() {});
    });
  }

  void getPolyPoints() async {
  PolylinePoints polylinePoints = PolylinePoints();

  LatLng petLocation = await getCoordinatesForCity(cityName);

  PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    google_api_key,
    PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    PointLatLng(petLocation.latitude, petLocation.longitude),
    travelMode: TravelMode.driving,
  );

  if (result.points.isNotEmpty) {
    result.points.forEach((PointLatLng point) =>
        polylineCoordinates.add(LatLng(point.latitude, point.longitude)));

    updateDistance();
  }

  setState(() {});
}

Future<LatLng> getCoordinatesForCity(String cityName) async {
    List<geocoding.Location> locations = await geocoding.locationFromAddress(cityName);
    if (locations.isNotEmpty) {
      double latitude = locations.first.latitude;
      double longitude = locations.first.longitude;
      return LatLng(latitude, longitude);
    } else {
      // Handle case when the city name is not found
      return LatLng(0, 0);
    }
  }

  void updateDistance() {
  double totalDistance = 0;
  for (var i = 0; i < polylineCoordinates.length - 1; i++) {
    totalDistance += calculateDistance(
      polylineCoordinates[i].latitude,
      polylineCoordinates[i].longitude,
      polylineCoordinates[i + 1].latitude,
      polylineCoordinates[i + 1].longitude,
    );
  }
  print(totalDistance);

  setState(() {
    distance = totalDistance;
  });
}

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
          cos(lat1 * p) * cos(lat2 * p) * 
          (1 - cos((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/images/user_icon.png",
    ).then((icon) => currentLocationIcon = icon);

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/images/petlocation.png",
    ).then((icon) => petLocationIcon = icon);
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
      return Center(
        child: CircularProgressIndicator(),
      );

    return Column(
      children: [
        Container(
          height: 750,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
                zoom: 14.5,
              ),
              polylines: polylineCoordinates.isNotEmpty
                ? {
                    Polyline(
                      polylineId: PolylineId("route"),
                      points: polylineCoordinates,
                      color: ConstantColors.primary,
                      width: 6,
                    ),
                  }
                : Set<Polyline>(),
              markers: {
                Marker(
                markerId: MarkerId("currentLocation"),
                icon: currentLocationIcon,
                position: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
              ),
              Marker(
                markerId: MarkerId("petLocation"),
                icon: petLocationIcon,
                position: polylineCoordinates.isNotEmpty
                        ? polylineCoordinates.last
                        : LatLng(0, 0),
                )
              },
                onMapCreated: (mapController) {
                  _controller.complete(mapController);
                },
              ),
              Positioned(
                    bottom: 150,
                    left: 40,
                    child: Container( 
                     child: Card( 
                         child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text("Pet Distance: " + distance.toStringAsFixed(2) + " KM",
                                         style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold))
                         ),
                     )
                    )
                 ),
              Positioned(
                    top: -7,
                    left: 0,
                    child: ElevatedButton.icon(
                      onPressed: () {
                          Navigator.pushNamed(context, ConstantRoutes.requests);
                      },
                      icon: Icon(Icons.keyboard_return),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ConstantColors.primary,
                      ), 
                      label: Text(''),
                ),
              )
            ]
          ),
        ),
      ],
    );
  }
}
