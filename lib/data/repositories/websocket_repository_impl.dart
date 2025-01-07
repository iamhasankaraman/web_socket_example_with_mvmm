import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/constants/api_constants.dart';
import '../../core/enums/connection_status.dart';
import '../../domain/repositories/websocket_repository.dart';
import '../models/websocket_message.dart';

class WebSocketRepositoryImpl implements WebSocketRepository {
  WebSocketChannel? _channel;
  final _connectionStatusController =
      StreamController<ConnectionStatus>.broadcast();
  final _messagesController = StreamController<WebSocketMessage>.broadcast();
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;

  @override
  Stream<ConnectionStatus> get connectionStatus =>
      _connectionStatusController.stream;

  @override
  Stream<WebSocketMessage> get messages => _messagesController.stream;

  @override
  Future<void> connect() async {
    if (_channel != null) return;

    try {
      _connectionStatusController.add(ConnectionStatus.connecting);

      _channel = WebSocketChannel.connect(Uri.parse(ApiConstants.wsUrl));

      _channel!.stream.listen(
        (message) {
          try {
            final data = jsonDecode(message as String);
            final wsMessage = WebSocketMessage.fromJson(data);
            _messagesController.add(wsMessage);
          } catch (e) {
            // Handle message parsing error
          }
        },
        onDone: _handleDisconnection,
        onError: (error) {
          _connectionStatusController.add(ConnectionStatus.failed);
          _handleDisconnection();
        },
      );

      _connectionStatusController.add(ConnectionStatus.connected);
      _reconnectAttempts = 0;
    } catch (e) {
      _connectionStatusController.add(ConnectionStatus.failed);
      _handleDisconnection();
    }
  }

  @override
  Future<void> disconnect() async {
    await _channel?.sink.close();
    _channel = null;
    _reconnectTimer?.cancel();
    _connectionStatusController.add(ConnectionStatus.disconnected);
  }

  @override
  Future<void> sendMessage(WebSocketMessage message) async {
    if (_channel == null) throw Exception('WebSocket is not connected');

    final jsonMessage = jsonEncode(message.toJson());
    _channel!.sink.add(jsonMessage);
  }

  void _handleDisconnection() {
    _channel = null;
    _connectionStatusController.add(ConnectionStatus.disconnected);

    if (_reconnectAttempts < ApiConstants.maxReconnectAttempts) {
      _reconnectTimer?.cancel();
      _reconnectTimer = Timer(ApiConstants.reconnectDelay, () {
        _reconnectAttempts++;
        connect();
      });
    }
  }

  void dispose() {
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    _connectionStatusController.close();
    _messagesController.close();
  }
}
