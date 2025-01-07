import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/websocket_message.dart';
import 'message_bubble.dart';

class MessageList extends StatelessWidget {
  final List<WebSocketMessage> messages;

  const MessageList({
    super.key,
    required this.messages,
  });

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      return Center(
        child: Text('common.no_data'.tr()),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return MessageBubble(message: message);
      },
    );
  }
}
