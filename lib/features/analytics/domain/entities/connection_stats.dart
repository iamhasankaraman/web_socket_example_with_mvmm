import 'package:equatable/equatable.dart';

class ConnectionStats extends Equatable {
  final int totalMessages;
  final int sentMessages;
  final int receivedMessages;
  final int reconnectAttempts;
  final Duration totalUptime;
  final Duration averageResponseTime;
  final DateTime lastActivity;

  const ConnectionStats({
    required this.totalMessages,
    required this.sentMessages,
    required this.receivedMessages,
    required this.reconnectAttempts,
    required this.totalUptime,
    required this.averageResponseTime,
    required this.lastActivity,
  });

  @override
  List<Object?> get props => [
        totalMessages,
        sentMessages,
        receivedMessages,
        reconnectAttempts,
        totalUptime,
        averageResponseTime,
        lastActivity,
      ];
}
