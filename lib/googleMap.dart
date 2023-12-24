import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapController extends GetxController {
  late GoogleMapController mapController;
  var currentLocation = LatLng(24.916619747110225, 91.83238258273906).obs;
  var markerLocation = LatLng(24.916619747110225, 91.83238258273906).obs;
  var polylineCoordinates = <LatLng>[].obs;

  void initCurrentLocation() async {
    var location = Location();
    var currentLocationData = await location.getLocation();
    currentLocation.value =
        LatLng(currentLocationData.latitude!, currentLocationData.longitude!);
    polylineCoordinates.add(currentLocation.value);
  }

  void startLocationUpdates() {
    var location = Location();
    location.onLocationChanged.listen((LocationData locationData) {
      currentLocation.value =
          LatLng(locationData.latitude!, locationData.longitude!);

      if (markerLocation.value == currentLocation.value) {
        markerLocation.value = currentLocation.value;
        polylineCoordinates.add(markerLocation.value);
      } else {
        polylineCoordinates.clear();
        polylineCoordinates.add(markerLocation.value);
        polylineCoordinates.add(currentLocation.value);
      }
    });
  }

  void onMarkerDragEnd(LatLng newPosition) {
    markerLocation.value = newPosition;
    polylineCoordinates.clear();
    polylineCoordinates.add(markerLocation.value);
    polylineCoordinates.add(currentLocation.value);
  }
}

class googleMap extends StatelessWidget {
  final GoogleMapController controller = Get.put(GoogleMapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Real Time Location Tracker",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: controller.currentLocation.value,
                  zoom: 18,
                ),
                zoomControlsEnabled: true,
                myLocationEnabled: true,
                markers: {
                  Marker(
                    markerId: const MarkerId('initialPosition'),
                    position: controller.markerLocation.value,
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen),
                    infoWindow: InfoWindow(
                      title: 'Marker Location',
                      snippet:
                          'Lat: ${controller.markerLocation.value.latitude}, Lng: ${controller.markerLocation.value.longitude}',
                    ),
                    draggable: true,
                    onDragEnd: controller.onMarkerDragEnd,
                  ),
                },
                polylines: {
                  Polyline(
                    polylineId: const PolylineId('route'),
                    color: Colors.blue,
                    points: controller.polylineCoordinates.toList(),
                    width: 5,
                  ),
                },
                onMapCreated: (controller) {
                  this.controller.mapController =
                      controller as GoogleMapController;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Text(
                'Current Location: Lat ${controller.currentLocation.value.latitude}, Lng ${controller.currentLocation.value.longitude}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
