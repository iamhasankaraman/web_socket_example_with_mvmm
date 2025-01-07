// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WebSocketMessageImpl _$$WebSocketMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$WebSocketMessageImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      content: json['content'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      sender: json['sender'] as String?,
    );

Map<String, dynamic> _$$WebSocketMessageImplToJson(
        _$WebSocketMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'content': instance.content,
      'timestamp': instance.timestamp.toIso8601String(),
      'sender': instance.sender,
    };
