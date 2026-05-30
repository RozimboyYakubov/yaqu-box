class RestaurantModel {
  final String id;
  final String name;
  final String imageUrl;
  final String mainProductName;
  final String workingHours;
  final String distance;
  final int originalPrice;
  final int yaquBoxPrice;
  final double rating;
  final String location;
  final String type;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.mainProductName,
    required this.workingHours,
    required this.distance,
    required this.originalPrice,
    required this.yaquBoxPrice,
    required this.rating,
    required this.location,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'mainProductName': mainProductName,
      'workingHours': workingHours,
      'distance': distance,
      'originalPrice': originalPrice,
      'yaquBoxPrice': yaquBoxPrice,
      'rating': rating,
      'location': location,
      'type': type,
    };
  }

  factory RestaurantModel.fromMap(Map<String, dynamic> map) {
    return RestaurantModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      mainProductName: map['mainProductName'] ?? '',
      workingHours: map['workingHours'] ?? '',
      distance: map['distance'] ?? '',
      originalPrice: map['originalPrice'] ?? 0,
      yaquBoxPrice: map['yaquBoxPrice'] ?? 0,
      rating: (map['rating'] ?? 0).toDouble(),
      location: map['location'] ?? '',
      type: map['type'] ?? '',
    );
  }
}