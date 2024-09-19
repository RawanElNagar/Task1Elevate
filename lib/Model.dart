class Product {
  final int id;
  final String title;
  final String imageUrl;
  final double price;
  final double rating;

  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image'],
      price: (json['price'] as num).toDouble(),
      rating: json['rating']['rate'].toDouble(),
    );
  }
}
