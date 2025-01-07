enum ConnectionStatus {
  connecting,
  connected,
  disconnected,
  failed;

  bool get isConnecting => this == ConnectionStatus.connecting;
  bool get isConnected => this == ConnectionStatus.connected;
  bool get isDisconnected => this == ConnectionStatus.disconnected;
  bool get isFailed => this == ConnectionStatus.failed;
}
