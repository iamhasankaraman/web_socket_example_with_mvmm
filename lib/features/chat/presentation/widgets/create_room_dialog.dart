import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chat_rooms_provider.dart';

class CreateRoomDialog extends StatefulWidget {
  const CreateRoomDialog({super.key});

  @override
  State<CreateRoomDialog> createState() => _CreateRoomDialogState();
}

class _CreateRoomDialogState extends State<CreateRoomDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  bool _isPrivate = false;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ChatRoomsProvider>().createRoom(
            name: _nameController.text,
            description: _descriptionController.text,
            isPrivate: _isPrivate,
          );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('chat.create_room'.tr()),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'chat.room_name'.tr(),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'chat.name_required'.tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'chat.room_description'.tr(),
              ),
              maxLines: 3,
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return 'chat.description_required'.tr();
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: Text('chat.private_room'.tr()),
              value: _isPrivate,
              onChanged: (value) => setState(() => _isPrivate = value),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('common.cancel'.tr()),
        ),
        TextButton(
          onPressed: _handleSubmit,
          child: Text('common.save'.tr()),
        ),
      ],
    );
  }
}
