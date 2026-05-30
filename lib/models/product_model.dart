class ProductModel {
  final String id;
  final String restaurantId;
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final int quantity;
  final bool isAvailable;

  ProductModel({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.quantity = 0,
    this.isAvailable = true,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'isAvailable': isAvailable,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      restaurantId: map['restaurantId'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? 0,
      imageUrl: map['imageUrl'] ?? '',
      quantity: map['quantity'] ?? 0,
      isAvailable: map['isAvailable'] ?? true,
    );
  }

  ProductModel copyWith({
    String? id,
    String? restaurantId,
    String? name,
    String? description,
    int? price,
    String? imageUrl,
    int? quantity,
    bool? isAvailable,
  }) {
    return ProductModel(
      id: id ?? this.id,
      restaurantId: restaurantId ?? this.restaurantId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      quantity: quantity ?? this.quantity,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}