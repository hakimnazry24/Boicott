class Retailer {
  int id;
  String name;
  String country;

  Retailer({
    required this.id,
    required this.name,
    required this.country,
  });

  factory Retailer.fromJson(Map<String, dynamic> json) {
    return Retailer(
      id: json["id"],
      name: json["name"],
      country: json["country"],
    );
  }
}
