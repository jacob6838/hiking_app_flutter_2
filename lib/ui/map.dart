import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hiking_app/hiking_service.dart';
import 'package:hiking_app/models/location_status.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatelessWidget {
  final HikingService? hikingService;
  const MapPage({super.key, this.hikingService});

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(51.509364, -0.128928),
        initialZoom: 9.2,
      ),
      children: [
        TileLayer(
          urlTemplate:
              "https://api.maptiler.com/maps/outdoor-v2/{z}/{x}/{y}.png?key=${dotenv.env['MAPTILER_API_KEY']}",
          // 'https://api.maptiler.com/tiles/satellite-v2/{z}/{x}/{y}.jpg?key=ffSM31w0WC5ndF9f53tR',
          // urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.hikelytics.hiking_app',
        ),
        RichAttributionWidget(
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
        if (hikingService != null)
          StreamBuilder<LocationStatus>(
            stream: hikingService!.currentLocationStatus,
            builder: (context, snapshot) {
              return MarkerLayer(
                markers: [
                  if (snapshot.data != null)
                    Marker(
                      point: LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude),
                      width: 80,
                      height: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        if (hikingService != null)
          StreamBuilder<List<LocationStatus>>(
            stream: hikingService!.currentPathSub,
            builder: (context, snapshot) {
              return PolylineLayer(
                polylines: [
                  if (snapshot.data != null)
                    Polyline(
                      points: snapshot.data!
                          .map((e) => LatLng(e.latitude, e.longitude))
                          .toList(),
                      strokeWidth: 4.0,
                      color: Colors.blue,
                    ),
                ],
              );
            },
          ),
      ],
    );
  }
}
