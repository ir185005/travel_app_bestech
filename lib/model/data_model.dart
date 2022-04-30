class DataModel {
  final String name;
  final String img;
  final int price;
  final int people;
  final int stars;
  final String description;
  final String location;
  DataModel({
    required this.location,
    required this.img,
    required this.price,
    required this.name,
    required this.description,
    required this.people,
    required this.stars,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      location: json['location'],
      img: json['img'],
      price: json['price'],
      name: json['name'],
      description: json['description'],
      people: json['people'],
      stars: json['stars'],
    );
  }
}
