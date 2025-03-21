// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WebSocketMessage _$WebSocketMessageFromJson(Map<String, dynamic> json) {
  return _WebSocketMessage.fromJson(json);
}

/// @nodoc
mixin _$WebSocketMessage {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get sender => throw _privateConstructorUsedError;

  /// Serializes this WebSocketMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebSocketMessageCopyWith<WebSocketMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketMessageCopyWith<$Res> {
  factory $WebSocketMessageCopyWith(
          WebSocketMessage value, $Res Function(WebSocketMessage) then) =
      _$WebSocketMessageCopyWithImpl<$Res, WebSocketMessage>;
  @useResult
  $Res call(
      {String id,
      String type,
      String content,
      DateTime timestamp,
      String? sender});
}

/// @nodoc
class _$WebSocketMessageCopyWithImpl<$Res, $Val extends WebSocketMessage>
    implements $WebSocketMessageCopyWith<$Res> {
  _$WebSocketMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? content = null,
    Object? timestamp = null,
    Object? sender = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebSocketMessageImplCopyWith<$Res>
    implements $WebSocketMessageCopyWith<$Res> {
  factory _$$WebSocketMessageImplCopyWith(_$WebSocketMessageImpl value,
          $Res Function(_$WebSocketMessageImpl) then) =
      __$$WebSocketMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String content,
      DateTime timestamp,
      String? sender});
}

/// @nodoc
class __$$WebSocketMessageImplCopyWithImpl<$Res>
    extends _$WebSocketMessageCopyWithImpl<$Res, _$WebSocketMessageImpl>
    implements _$$WebSocketMessageImplCopyWith<$Res> {
  __$$WebSocketMessageImplCopyWithImpl(_$WebSocketMessageImpl _value,
      $Res Function(_$WebSocketMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? content = null,
    Object? timestamp = null,
    Object? sender = freezed,
  }) {
    return _then(_$WebSocketMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WebSocketMessageImpl implements _WebSocketMessage {
  const _$WebSocketMessageImpl(
      {required this.id,
      required this.type,
      required this.content,
      required this.timestamp,
      this.sender});

  factory _$WebSocketMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebSocketMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String content;
  @override
  final DateTime timestamp;
  @override
  final String? sender;

  @override
  String toString() {
    return 'WebSocketMessage(id: $id, type: $type, content: $content, timestamp: $timestamp, sender: $sender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebSocketMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.sender, sender) || other.sender == sender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, content, timestamp, sender);

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebSocketMessageImplCopyWith<_$WebSocketMessageImpl> get copyWith =>
      __$$WebSocketMessageImplCopyWithImpl<_$WebSocketMessageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WebSocketMessageImplToJson(
      this,
    );
  }
}

abstract class _WebSocketMessage implements WebSocketMessage {
  const factory _WebSocketMessage(
      {required final String id,
      required final String type,
      required final String content,
      required final DateTime timestamp,
      final String? sender}) = _$WebSocketMessageImpl;

  factory _WebSocketMessage.fromJson(Map<String, dynamic> json) =
      _$WebSocketMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get content;
  @override
  DateTime get timestamp;
  @override
  String? get sender;

  /// Create a copy of WebSocketMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebSocketMessageImplCopyWith<_$WebSocketMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
