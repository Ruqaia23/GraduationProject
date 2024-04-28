// ... الاستيرادات والكلاسات المطلوبة
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taskfull/config/theme.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(23.8859, 45.0792),
              zoom: 6,
            ),
            onTap: (LatLng location) {
              setState(() {
                _selectedLocation = location;
              });
            },
            markers: _selectedLocation != null
                ? <Marker>[
                    Marker(
                      markerId: MarkerId("selected-location"),
                      position: _selectedLocation!,
                    ),
                  ].toSet()
                : Set<Marker>(),
          ),
          Positioned(
            top: 700,
            left: 33,
            right: 33,
            child: GestureDetector(
              onTap: () {
                _showLocationDialog(context);
              },
              child: Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xff99BC85),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  'Done',
                  style: customText().bold(24, Colors.white),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showLocationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Location'),
          content: Text(
              'Do you want to save the selected location: $_selectedLocation'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _saveLocation();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('No')),
          ],
        );
      },
    );
  }

  void _saveLocation() {
    //   تنفيذ الخطوات اللازمة لحفظ الموقع
    print(
        'Selected Location: $_selectedLocation'); // مثال: طباعة الموقع المحدد في الكونسول
  }
}
