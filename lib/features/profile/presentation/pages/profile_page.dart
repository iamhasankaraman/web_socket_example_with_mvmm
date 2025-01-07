import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import '../../../auth/presentation/providers/auth_provider.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile.title'.tr()),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'profile.edit'.tr(),
            onPressed: () {
              // TODO: Implement edit profile
            },
          ),
        ],
      ),
      body: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          final user = auth.user;
          if (user == null) {
            return Center(child: Text('common.error'.tr()));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(
                  user.name[0],
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text('profile.name'.tr()),
                subtitle: Text(user.name),
              ),
              ListTile(
                title: Text('auth.email'.tr()),
                subtitle: Text(user.email),
              ),
              ListTile(
                title: Text('profile.member_since'.tr()),
                subtitle: Text(DateFormat.yMMMd().format(DateTime.now())),
              ),
              ListTile(
                title: Text('profile.last_seen'.tr()),
                subtitle: Text('analytics.just_now'.tr()),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  auth.logout();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
                child: Text('auth.logout'.tr()),
              ),
            ],
          );
        },
      ),
    );
  }
}
