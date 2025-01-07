import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:web_socket_example_with_mvmm/core/router/app_router.dart';

import '../providers/auth_provider.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      await context.read<AuthProvider>().login(
            _emailController.text,
            _passwordController.text,
          );

      if (!mounted) return;

      if (context.read<AuthProvider>().user != null) {
        AutoRouter.of(context).replace(const HomeRoute());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('auth.login'.tr()),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          if (auth.isAuthenticated) {
            Future.microtask(
                () => Navigator.of(context).pushReplacementNamed('/home'));
          }

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'auth.email'.tr(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'auth.email_required'.tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'auth.password'.tr(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'auth.password_required'.tr();
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  if (auth.error != null)
                    Text(
                      auth.error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: auth.isLoading ? null : _handleSubmit,
                    child: auth.isLoading
                        ? const CircularProgressIndicator()
                        : Text('auth.login'.tr()),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement forgot password
                    },
                    child: Text('auth.forgotPassword'.tr()),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
