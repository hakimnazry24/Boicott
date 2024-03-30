class Product {
  int id;
  String name;
  String image;
  String serialNumber;
  bool isBoycott;
  String comment;
  String evidenceLink;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.serialNumber,
    required this.isBoycott,
    this.comment = "",
    this.evidenceLink = "",
  });
}
