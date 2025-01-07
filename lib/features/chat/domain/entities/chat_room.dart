import 'package:equatable/equatable.dart';

class ChatRoom extends Equatable {
  final String id;
  final String name;
  final String description;
  final int participantCount;
  final DateTime lastActivity;
  final bool isPrivate;

  const ChatRoom({
    required this.id,
    required this.name,
    required this.description,
    required this.participantCount,
    required this.lastActivity,
    this.isPrivate = false,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        participantCount,
        lastActivity,
        isPrivate,
      ];
}
