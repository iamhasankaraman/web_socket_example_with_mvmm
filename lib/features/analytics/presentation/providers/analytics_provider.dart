import 'dart:async';
import 'package:flutter/material.dart';

import '../../../../core/enums/connection_status.dart';
import '../../../../data/models/websocket_message.dart';
import '../../../../data/repositories/websocket_repository_impl.dart';
import '../../domain/entities/connection_stats.dart';

class AnalyticsProvider extends ChangeNotifier {
  final WebSocketRepositoryImpl _websocketRepository;
  StreamSubscription<ConnectionStatus>? _connectionSubscription;
  StreamSubscription<WebSocketMessage>? _messageSubscription;
  Timer? _uptimeTimer;
  DateTime? _connectionStartTime;
  int _sentMessages = 0;
  int _receivedMessages = 0;
  int _reconnectAttempts = 0;
  List<Duration> _responseTimes = [];

  ConnectionStats? _stats;
  ConnectionStats? get stats => _stats;

  AnalyticsProvider({required WebSocketRepositoryImpl websocketRepository})
      : _websocketRepository = websocketRepository {
    _initSubscriptions();
  }

  void _initSubscriptions() {
    _connectionSubscription = _websocketRepository.connectionStatus.listen(
      (status) {
        if (status == ConnectionStatus.connected) {
          _connectionStartTime ??= DateTime.now();
          _startUptimeTimer();
        } else if (status == ConnectionStatus.disconnected) {
          _reconnectAttempts++;
        }
        _updateStats();
      },
    );

    _messageSubscription = _websocketRepository.messages.listen(
      (message) {
        _receivedMessages++;
        _updateStats();
      },
    );
  }

  void _startUptimeTimer() {
    _uptimeTimer?.cancel();
    _uptimeTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateStats(),
    );
  }

  void _updateStats() {
    if (_connectionStartTime == null) return;

    _stats = ConnectionStats(
      totalMessages: _sentMessages + _receivedMessages,
      sentMessages: _sentMessages,
      receivedMessages: _receivedMessages,
      reconnectAttempts: _reconnectAttempts,
      totalUptime: DateTime.now().difference(_connectionStartTime!),
      averageResponseTime: _calculateAverageResponseTime(),
      lastActivity: DateTime.now(),
    );

    notifyListeners();
  }

  Duration _calculateAverageResponseTime() {
    if (_responseTimes.isEmpty) return Duration.zero;
    final total = _responseTimes.fold<int>(
      0,
      (sum, duration) => sum + duration.inMilliseconds,
    );
    return Duration(milliseconds: total ~/ _responseTimes.length);
  }

  void messageSent() {
    _sentMessages++;
    _updateStats();
  }

  void addResponseTime(Duration time) {
    _responseTimes.add(time);
    _updateStats();
  }

  @override
  void dispose() {
    _connectionSubscription?.cancel();
    _messageSubscription?.cancel();
    _uptimeTimer?.cancel();
    super.dispose();
  }
}
