import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/enums/connection_status.dart';
import '../../../../data/models/websocket_message.dart';
import '../../../../data/repositories/websocket_repository_impl.dart';

class HomeProvider extends ChangeNotifier {
  final WebSocketRepositoryImpl _websocketRepository;
  StreamSubscription<ConnectionStatus>? _connectionSubscription;
  StreamSubscription<WebSocketMessage>? _messageSubscription;

  ConnectionStatus _connectionStatus = ConnectionStatus.disconnected;
  List<WebSocketMessage> _messages = [];
  String? _error;

  HomeProvider({required WebSocketRepositoryImpl websocketRepository})
      : _websocketRepository = websocketRepository {
    _initWebSocket();
  }

  ConnectionStatus get connectionStatus => _connectionStatus;
  List<WebSocketMessage> get messages => _messages;
  String? get error => _error;

  void _initWebSocket() {
    _connectionSubscription = _websocketRepository.connectionStatus.listen(
      (status) {
        _connectionStatus = status;
        notifyListeners();
      },
    );

    _messageSubscription = _websocketRepository.messages.listen(
      (message) {
        _messages = List.of(_messages)..add(message);
        notifyListeners();
      },
    );

    _websocketRepository.connect();
  }

  Future<void> sendMessage(String content) async {
    try {
      final message = WebSocketMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        type: 'message',
        content: content,
        timestamp: DateTime.now(),
        sender: 'user',
      );

      await _websocketRepository.sendMessage(message);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _connectionSubscription?.cancel();
    _messageSubscription?.cancel();
    _websocketRepository.dispose();
    super.dispose();
  }
}
