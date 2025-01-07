import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

import '../../../../app/theme/theme_provider.dart';
import '../providers/settings_provider.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr()),
      ),
      body: Consumer2<SettingsProvider, ThemeProvider>(
        builder: (context, settings, theme, _) {
          return ListView(
            children: [
              ListTile(
                title: Text('settings.language'.tr()),
                subtitle: Text(_getLanguageName(context.locale.languageCode)),
                onTap: () => _showLanguageDialog(context),
              ),
              ListTile(
                title: Text('settings.theme'.tr()),
                subtitle:
                    Text(_getThemeName(theme?.themeMode ?? ThemeMode.system)),
                onTap: () => _showThemeDialog(context),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('settings.select_language'.tr()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  context.read<SettingsProvider>().setLanguage(
                        context,
                        const Locale('en'),
                      );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Türkçe'),
                onTap: () {
                  context.read<SettingsProvider>().setLanguage(
                        context,
                        const Locale('tr'),
                      );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('settings.select_theme'.tr()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('settings.theme_system'.tr()),
                onTap: () {
                  context.read<ThemeProvider>().setTheme(ThemeMode.system);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('settings.theme_light'.tr()),
                onTap: () {
                  context.read<ThemeProvider>().setTheme(ThemeMode.light);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('settings.theme_dark'.tr()),
                onTap: () {
                  context.read<ThemeProvider>().setTheme(ThemeMode.dark);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'tr':
        return 'Türkçe';
      default:
        return languageCode;
    }
  }

  String _getThemeName(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return 'settings.theme_system'.tr();
      case ThemeMode.light:
        return 'settings.theme_light'.tr();
      case ThemeMode.dark:
        return 'settings.theme_dark'.tr();
    }
  }
}
