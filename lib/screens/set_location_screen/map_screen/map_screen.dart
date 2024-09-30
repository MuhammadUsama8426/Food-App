import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  final Function(LatLng) onLocationSelected;

  const MapScreen({required this.onLocationSelected, super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation;
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    requestLocationPermission();
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      await Permission.location.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              if (_selectedLocation != null) {
                widget.onLocationSelected(_selectedLocation!);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a location.')),
                );
              }
            },
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.422, -122.084), // Default location
          zoom: 14,
        ),
        onTap: (LatLng location) {
          setState(() {
            _selectedLocation = location; // Store the selected location
          });
        },
        markers: _selectedLocation == null
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('selected-location'),
                  position: _selectedLocation!,
                ),
              },
      ),
    );
  }
}
