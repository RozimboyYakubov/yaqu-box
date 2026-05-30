class UserModel {
  final String uid;
  final String name;
  final String phoneNumber;
  final String location;
  final String? profileImageUrl;
  final DateTime createdAt;
  final bool isVerified;

  UserModel({
    required this.uid,
    required this.name,
    required this.phoneNumber,
    required this.location,
    this.profileImageUrl,
    required this.createdAt,
    this.isVerified = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phoneNumber': phoneNumber,
      'location': location,
      'profileImageUrl': profileImageUrl,
      'createdAt': createdAt.toIso8601String(),
      'isVerified': isVerified,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      location: map['location'] ?? '',
      profileImageUrl: map['profileImageUrl'],
      createdAt: DateTime.parse(map['createdAt'] ?? DateTime.now().toIso8601String()),
      isVerified: map['isVerified'] ?? false,
    );
  }
}