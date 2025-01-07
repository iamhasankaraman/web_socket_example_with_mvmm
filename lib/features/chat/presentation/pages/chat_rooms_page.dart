import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import '../providers/chat_rooms_provider.dart';
import '../widgets/chat_room_card.dart';
import '../widgets/create_room_dialog.dart';

@RoutePage()
class ChatRoomsPage extends StatelessWidget {
  const ChatRoomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatRoomsProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('chat.rooms'.tr()),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _showCreateRoomDialog(context),
            ),
          ],
        ),
        body: Consumer<ChatRoomsProvider>(
          builder: (context, provider, _) {
            if (provider.isLoading) {
              return Center(child: Text('common.loading'.tr()));
            }

            if (provider.error != null) {
              return Center(
                child: Text(
                  'common.error'.tr(args: [provider.error!]),
                ),
              );
            }

            return _buildRoomsList(context, provider);
          },
        ),
      ),
    );
  }

  Widget _buildRoomsList(BuildContext context, ChatRoomsProvider provider) {
    if (provider.rooms.isEmpty) {
      return Center(child: Text('chat.no_rooms'.tr()));
    }

    return RefreshIndicator(
      onRefresh: () => provider.loadRooms(),
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: provider.rooms.length,
        itemBuilder: (context, index) {
          final room = provider.rooms[index];
          return ChatRoomCard(
            room: room,
            onTap: () => provider.joinRoom(room),
          );
        },
      ),
    );
  }

  void _showCreateRoomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreateRoomDialog(),
    );
  }
}
