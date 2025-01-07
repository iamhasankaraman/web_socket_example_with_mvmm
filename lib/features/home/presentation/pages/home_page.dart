import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../core/enums/connection_status.dart';
import '../../../../data/repositories/websocket_repository_impl.dart';
import '../providers/home_provider.dart';
import '../widgets/message_list.dart';
import '../widgets/send_message_form.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(
        websocketRepository: context.read<WebSocketRepositoryImpl>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('home.title'.tr()),
          actions: [
            IconButton(
              icon: const Icon(Icons.chat),
              tooltip: 'chat.rooms'.tr(),
              onPressed: () => Navigator.pushNamed(context, '/chat-rooms'),
            ),
            IconButton(
              icon: const Icon(Icons.analytics),
              tooltip: 'analytics.title'.tr(),
              onPressed: () => Navigator.pushNamed(context, '/analytics'),
            ),
            IconButton(
              icon: const Icon(Icons.person),
              tooltip: 'profile.title'.tr(),
              onPressed: () => Navigator.pushNamed(context, '/profile'),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'settings.title'.tr(),
              onPressed: () => Navigator.pushNamed(context, '/settings'),
            ),
          ],
        ),
        body: Consumer<HomeProvider>(
          builder: (context, home, _) {
            return Column(
              children: [
                _buildConnectionStatus(context, home.connectionStatus),
                const Divider(),
                Expanded(
                  child: MessageList(messages: home.messages),
                ),
                const SendMessageForm(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildConnectionStatus(BuildContext context, ConnectionStatus status) {
    final color = switch (status) {
      ConnectionStatus.connected => Colors.green,
      ConnectionStatus.connecting => Colors.orange,
      _ => Colors.red,
    };

    final text = switch (status) {
      ConnectionStatus.connected => 'home.connected'.tr(),
      ConnectionStatus.connecting => 'home.connecting'.tr(),
      ConnectionStatus.disconnected => 'home.disconnected'.tr(),
      ConnectionStatus.failed => 'common.error'.tr(args: ['Connection failed']),
    };

    return Container(
      padding: const EdgeInsets.all(8),
      color: color.withOpacity(0.1),
      child: Row(
        children: [
          Icon(Icons.circle, size: 12, color: color),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}
