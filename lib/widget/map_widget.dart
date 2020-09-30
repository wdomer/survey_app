import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  final Function onTap;

  const MapWidget({Key key, this.onTap}) : super(key: key);
  @override
  State<MapWidget> createState() => MapWidgetState();
}

class MapWidgetState extends State<MapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _googleMapController;
  Set<Marker> _markers={};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(15.5007, 32.5599),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(15.5007, 32.5599),
      tilt: 59.440717697143555,
      zoom: 50.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        // zoomControlsEnabled: true,
        //  scrollGesturesEnabled: true,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        compassEnabled: true,
        rotateGesturesEnabled: true,
        mapToolbarEnabled: true,
        tiltGesturesEnabled: true,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
          new Factory<OneSequenceGestureRecognizer>(
            () => new EagerGestureRecognizer(),
          ),
        ].toSet(),

        onTap: _handleTap
      ),
    );
  }
  _handleTap(LatLng latLng) {
    setState(() {
      _markers.clear();
      widget.onTap("${latLng.latitude}", "${latLng.longitude}");
      _markers.add(Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        infoWindow: InfoWindow(
          title: 'Choosed location',
        ),
        icon:
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    });
  }

//

}

//_controller.**onMarkerTapped**.add((marker){
//
//  String title= marker.options.infoWindowText.title;
//  String latitude= marker.options.position.latitude.toString();
//  String longitude= marker.options.position.longitude.toString();
//
//  });

//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: _goToTheLake,
//        label: Text('To the lake!'),
//        icon: Icon(Icons.directions_boat),
//      ),

//  Future<void> _goToTheLake() async {
//    final GoogleMapController controller = await _controller.future;
//    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//  }
