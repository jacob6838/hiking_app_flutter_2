// import 'package:flutter/material.dart';
// import 'package:hiking_app/hiking_service.dart';
// import 'package:provider/provider.dart';

// class TripsListPage extends StatelessWidget {
//   late HikingService? _hikingService;
//   TripsListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     _hikingService = Provider.of<HikingService>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Trips List'),
//       ),
//       body: StreamBuilder<Object>(
//         stream: _hikingService!.archiveService.,
//         builder: (context, snapshot) {
//           return ListView.builder(
//             itemCount: trips.length,
//             itemBuilder: (context, index) {
//               final trip = trips[index];
//               return ListTile(
//                 title: Text(trip['location']),
//                 subtitle: Text(
//                   'Duration: ${trip['duration']}, Length: ${trip['length']}, Elevation: ${trip['elevation']}',
//                 ),
//               );
//             },
//           );
//         }
//       ),
//     );
//   }
// }
