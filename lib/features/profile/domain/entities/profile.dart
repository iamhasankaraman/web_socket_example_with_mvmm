import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? avatarUrl;
  final String? bio;
  final DateTime createdAt;
  final DateTime? lastSeen;

  const Profile({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.bio,
    required this.createdAt,
    this.lastSeen,
  });

  @override
  List<Object?> get props =>
      [id, name, email, avatarUrl, bio, createdAt, lastSeen];
}
