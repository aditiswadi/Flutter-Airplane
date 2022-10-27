import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String country;
  final String imageUrl;
  final double rating;
  final int price;
  DestinationModel({
    required this.id,
    required this.name,
    required this.country,
    required this.imageUrl,
    required this.rating,
    required this.price,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      country,
      imageUrl,
      rating,
      price,
    ];
  }

  factory DestinationModel.initialDestination() {
    return DestinationModel(
      id: '',
      name: '',
      country: '',
      imageUrl: '',
      rating: 0,
      price: 0,
    );
  }

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        country: json['country'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
        price: json['price'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'imageUrl': imageUrl,
        'rating': rating,
        'price': price,
      };

  @override
  String toString() {
    return 'DestinationModel(id: $id, name: $name, country: $country, imageUrl: $imageUrl, rating: $rating, price: $price)';
  }
}
