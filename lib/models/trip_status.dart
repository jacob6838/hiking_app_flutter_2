import 'package:flutter/material.dart';

enum TripStatus { active, paused, stopped }

extension TripStatusName on TripStatus {
  String get name {
    switch (this) {
      case TripStatus.active:
        return "Active";
      case TripStatus.paused:
        return "Paused";
      case TripStatus.stopped:
        return "Stopped";
    }
  }
}

enum TripStatusCommand { start, pause, unpause, stop }

extension TripStatusCommand1 on TripStatusCommand {
  TripStatus get newStatus {
    switch (this) {
      case TripStatusCommand.start:
        return TripStatus.active;
      case TripStatusCommand.pause:
        return TripStatus.paused;
      case TripStatusCommand.unpause:
        return TripStatus.active;
      case TripStatusCommand.stop:
        return TripStatus.stopped;
    }
  }

  Color get color {
    switch (this) {
      case TripStatusCommand.start:
        return Colors.green;
      case TripStatusCommand.pause:
        return Colors.yellow;
      case TripStatusCommand.unpause:
        return Colors.green;
      case TripStatusCommand.stop:
        return Colors.red;
    }
  }

  IconData get icon {
    switch (this) {
      case TripStatusCommand.start:
        return Icons.play_arrow;
      case TripStatusCommand.pause:
        return Icons.pause_rounded;
      case TripStatusCommand.unpause:
        return Icons.play_arrow;
      case TripStatusCommand.stop:
        return Icons.stop_rounded;
    }
  }
}
