import 'package:web_socket_channel/web_socket_channel.dart';

import '../../core/enums/connection_status.dart';
import '../../data/models/websocket_message.dart';

abstract class WebSocketRepository {
  Stream<ConnectionStatus> get connectionStatus;
  Stream<WebSocketMessage> get messages;

  Future<void> connect();
  Future<void> disconnect();
  Future<void> sendMessage(WebSocketMessage message);
}
