import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({
    Key? key,
    required this.mapController,
    required this.onMapMoved,
  }) : super(key: key);

  final MapController mapController;
  final Function(GeoPoint) onMapMoved;

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  Timer? debounce;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          OSMFlutter(
            osmOption: const OSMOption(),
            controller: widget.mapController,
            onMapIsReady: (isReady) async {
              if (isReady) {
                await widget.mapController.setZoom(zoomLevel: 12);
                widget.mapController.listenerRegionIsChanging.addListener(() {
                  if (debounce?.isActive ?? false) debounce!.cancel();
                  debounce = Timer(const Duration(milliseconds: 500), () async {
                    GeoPoint centerPoint = await widget.mapController.centerMap;
                    widget.onMapMoved(centerPoint);
                  });
                });
              }
            },
          ),
          Center(
            child: IgnorePointer(
              child: Icon(
                Icons.location_on,
                size: 48,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}