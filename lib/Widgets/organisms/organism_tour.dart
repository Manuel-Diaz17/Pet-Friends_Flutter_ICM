import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:logger/logger.dart';
import 'package:pet_sitting_project/Constants/constant_routes.dart';
import 'dart:math';

import 'package:pet_sitting_project/Constants/constants_colors.dart';
import 'package:pet_sitting_project/bloc/petBloc.dart';

class OrganismTour extends StatefulWidget {
  const OrganismTour({Key? key}) : super(key: key);

  @override
  State<OrganismTour> createState() => _OrganismTourState();
}

class _OrganismTourState extends State<OrganismTour> {
  final Completer<GoogleMapController> _controller = Completer();

  final log = Logger();

  LocationData? currentLocation;

  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  double totalDistance = 0.0;
  LatLng? previousLatLng;

  Timer? _timer;
  int serviceTimeHours = 0;
  int serviceTimeSeconds = 0;

  void getCurrentLocation() async {
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
            zoom: 18,
            target: LatLng(
              newLoc.latitude!,
              newLoc.longitude!,
            ),
          ),
        ),
      );

      if (previousLatLng != null) {
        double distanceInMeters = calculateDistance(
          previousLatLng!,
          LatLng(newLoc.latitude!, newLoc.longitude!),
        );
        totalDistance += distanceInMeters;
      }

      previousLatLng = LatLng(newLoc.latitude!, newLoc.longitude!);

      setState(() {});
    });
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/images/pet_icon.png",
    ).then((icon) => currentLocationIcon = icon);
  }

  double calculateDistance(LatLng startLatLng, LatLng endLatLng) {
    const int earthRadius = 6371000; // in meters

    double lat1 = startLatLng.latitude;
    double lon1 = startLatLng.longitude;
    double lat2 = endLatLng.latitude;
    double lon2 = endLatLng.longitude;

    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c;
    return distance / 1000;
  }

  double _toRadians(double degree) {
    return degree * (pi / 180);
  }

  void startTimer(int serviceTime) {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (Timer timer) {
      setState(() {
        if (serviceTimeSeconds > 0) {
          serviceTimeSeconds--;
        } else {
          timer.cancel();
          showSummaryDialog();
          Navigator.pushNamed(context, ConstantRoutes.logged);
        }
      });
    });
  }

  String formatTime(int seconds) {
    final minutes = (seconds / 60).floor();
    final remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  int hoursToSeconds(int hours) {
    return (hours * 3600).round();
  }

  Future<bool?> showConfirmationDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to finish the tour?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () async {
                _timer?.cancel();
                Navigator.of(context)
                    .pop(true); // Return true when OK is pressed
              },
              child: const Text('Ok'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(false); // Return false when Cancel is pressed
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> showSummaryDialog() async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Summary'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Distance: ${totalDistance.toStringAsFixed(3)} km'),
              const SizedBox(height: 10),
              Text('Time Remaining: ${formatTime(serviceTimeSeconds)}'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    setCustomMarkerIcon();
    
    final pet = context
        .read<PetBloc>()
        .state;
    serviceTimeHours = pet.time!;
    serviceTimeSeconds = hoursToSeconds(serviceTimeHours);
    startTimer(serviceTimeSeconds);
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
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
          height: 635,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                currentLocation!.latitude!,
                currentLocation!.longitude!,
              ),
              zoom: 18,
            ),
            markers: {
              Marker(
                markerId: MarkerId("currentLocation"),
                icon: currentLocationIcon,
                position: LatLng(
                  currentLocation!.latitude!,
                  currentLocation!.longitude!,
                ),
              )
            },
            onMapCreated: (mapController) {
              _controller.complete(mapController);
            },
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.directions_walk),
                    SizedBox(width: 5),
                    Text(
                      '${totalDistance.toStringAsFixed(3)} km',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(width: 180),
                Row(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(width: 5),
                    Text(
                      '${formatTime(serviceTimeSeconds)}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () async {
                bool? confirm = await showConfirmationDialog();
                if (confirm != null && confirm) {
                  showSummaryDialog();
                  Navigator.pushNamed(context, ConstantRoutes.logged);
                }
              },
              icon: Icon(Icons.stop),
              label: Text("Finish"),
              style: ElevatedButton.styleFrom(
                backgroundColor: ConstantColors.primary,
              ),
            ),
          ],
        )
      ],
    );
  }
}
