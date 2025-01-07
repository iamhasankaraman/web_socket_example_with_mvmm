import 'package:flutter/material.dart';
import '../../domain/entities/chat_room.dart';

class ChatRoomsProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<ChatRoom> _rooms = [];
  String? _error;

  bool get isLoading => _isLoading;
  List<ChatRoom> get rooms => _rooms;
  String? get error => _error;

  ChatRoomsProvider() {
    loadRooms();
  }

  Future<void> loadRooms() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 1));
      _rooms = [
        ChatRoom(
          id: '1',
          name: 'General',
          description: 'General discussion about anything',
          participantCount: 150,
          lastActivity: DateTime.now(),
        ),
        ChatRoom(
          id: '2',
          name: 'Tech Talk',
          description: 'Discussions about technology and programming',
          participantCount: 75,
          lastActivity: DateTime.now().subtract(const Duration(minutes: 5)),
        ),
        ChatRoom(
          id: '3',
          name: 'Flutter Dev',
          description: 'Flutter development discussions',
          participantCount: 45,
          lastActivity: DateTime.now().subtract(const Duration(minutes: 15)),
        ),
      ];
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createRoom({
    required String name,
    required String description,
    bool isPrivate = false,
  }) async {
    try {
      final newRoom = ChatRoom(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        description: description,
        participantCount: 1,
        lastActivity: DateTime.now(),
        isPrivate: isPrivate,
      );

      _rooms = List.of(_rooms)..add(newRoom);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> joinRoom(ChatRoom room) async {
    // TODO: Implement room joining logic
  }
}
