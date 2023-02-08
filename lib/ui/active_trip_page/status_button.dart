import 'package:flutter/material.dart';
import 'package:hiking_app/models/trip_status.dart';

import '../trip_summary_page/main.dart';

class StatusButtons extends StatelessWidget {
  final Function(TripStatusCommand) sendCommand;
  final TripStatus tripStatus;
  StatusButtons(this.tripStatus, this.sendCommand);

  @override
  Widget build(BuildContext context) {
    switch (tripStatus) {
      case TripStatus.stopped:
        return TripCommandButton(TripStatusCommand.start, sendCommand);
      case TripStatus.paused:
        return Row(children: [
          TripCommandButton(TripStatusCommand.unpause, sendCommand),
          TripCommandButton(TripStatusCommand.stop, sendCommand),
        ]);
      case TripStatus.active:
        return Row(children: [
          TripCommandButton(TripStatusCommand.pause, sendCommand),
          TripCommandButton(TripStatusCommand.stop, sendCommand),
        ]);
    }
  }
}
// TODO: Uncomment
//     _hikingService = Provider.of<HikingService>(context);
//     const dateTextStyle = TextStyle(
//         fontSize: 10, color: Colors.purple, fontWeight: FontWeight.bold);

//     return SizedBox(
//       height: 80,
//       width: 80,
//       child: Container(
//         decoration: BoxDecoration(
//           color: !activeStatus ? Colors.green : Colors.red,
//           shape: BoxShape.circle,
//         ),
//         child: InkWell(
//           onTap: () async {
//             print("Button Pressed");
//             print(activeStatus);
//             switch (tripStatus) {
//               case TripStatus.active:
//                 // setState(() {
//                 //   isDropdownEnabled = true;
//                 // });
//                 final name = await onEnableBtnClicked(context, _hikingService!);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => TripSummaryPage()),
//                 );
//                 break;
//               case TripStatus.paused:
//                 final name = await onEnableBtnClicked(context, _hikingService!);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => TripSummaryPage()),
//                 );
//                 break;
//               case TripStatus.stopped:
//                 // setState(() {
//                 //   isDropdownEnabled = false;
//                 // });
//                 onEnableBtnClicked(context, _hikingService!);
//                 break;
//             }
//           },
//           child: Icon(
//             !activeStatus ? Icons.play_arrow : Icons.stop_rounded,
//             color: Colors.white,
//             size: 60,
//           ),
//         ),
//       ),
//     );
//   }
// }

class TripCommandButton extends StatelessWidget {
  final Function(TripStatusCommand) sendCommand;
  final TripStatusCommand command;

  TripCommandButton(this.command, this.sendCommand);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Container(
        decoration: BoxDecoration(
          color: command.color,
          shape: BoxShape.circle,
        ),
        child: InkWell(
          onTap: () async {
            print("Button Pressed");
            // TODO: Uncomment
            // print(activeStatus);
            sendCommand(command);
            if (command == TripStatusCommand.stop) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TripSummaryPage()),
              );
            }
          },
          child: Icon(
            command.icon,
            color: Colors.white,
            size: 60,
          ),
        ),
      ),
    );
  }
}
