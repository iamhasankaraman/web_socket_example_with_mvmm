import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/chat_room.dart';

class ChatRoomCard extends StatelessWidget {
  final ChatRoom room;
  final VoidCallback onTap;

  const ChatRoomCard({
    super.key,
    required this.room,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        onTap: onTap,
        title: Text(room.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(room.description),
            const SizedBox(height: 4),
            Text(
              '${room.participantCount} ${'chat.participants'.tr()} · ${_formatLastActivity(room.lastActivity)}',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        trailing: room.isPrivate
            ? const Icon(Icons.lock)
            : const Icon(Icons.lock_open),
      ),
    );
  }

  String _formatLastActivity(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'analytics.just_now'.tr();
    } else if (difference.inHours < 1) {
      return 'analytics.minutes_ago'
          .tr(args: [difference.inMinutes.toString()]);
    } else if (difference.inDays < 1) {
      return 'analytics.hours_ago'.tr(args: [difference.inHours.toString()]);
    } else {
      return DateFormat.MMMd().format(dateTime);
    }
  }
}
