import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../data/repositories/websocket_repository_impl.dart';
import '../providers/analytics_provider.dart';
import '../widgets/stat_card.dart';

@RoutePage()
class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AnalyticsProvider(
        websocketRepository: context.read<WebSocketRepositoryImpl>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('analytics.title'.tr()),
        ),
        body: Consumer<AnalyticsProvider>(
          builder: (context, provider, _) {
            final stats = provider.stats;
            if (stats == null) {
              return Center(child: Text('common.loading'.tr()));
            }

            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  'analytics.connection_stats'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                StatCard(
                  title: 'analytics.total_messages'.tr(),
                  value: stats.totalMessages.toString(),
                  icon: Icons.message,
                ),
                StatCard(
                  title: 'analytics.sent_messages'.tr(),
                  value: stats.sentMessages.toString(),
                  icon: Icons.send,
                ),
                StatCard(
                  title: 'analytics.received_messages'.tr(),
                  value: stats.receivedMessages.toString(),
                  icon: Icons.download,
                ),
                StatCard(
                  title: 'analytics.reconnect_attempts'.tr(),
                  value: stats.reconnectAttempts.toString(),
                  icon: Icons.refresh,
                ),
                const SizedBox(height: 24),
                Text(
                  'analytics.performance_metrics'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                StatCard(
                  title: 'analytics.total_uptime'.tr(),
                  value: _formatDuration(stats.totalUptime),
                  icon: Icons.timer,
                ),
                StatCard(
                  title: 'analytics.avg_response_time'.tr(),
                  value: '${stats.averageResponseTime.inMilliseconds}ms',
                  icon: Icons.speed,
                ),
                StatCard(
                  title: 'analytics.last_activity'.tr(),
                  value: _formatDateTime(stats.lastActivity),
                  icon: Icons.access_time,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String _formatDateTime(DateTime dateTime) {
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
      return DateFormat.yMMMd().add_Hm().format(dateTime);
    }
  }
}
