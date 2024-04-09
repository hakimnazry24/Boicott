class Product {
  int id;
  String name;
  int serialNumber;
  int retailerId;
  int companyId;

  Product({
    required this.id,
    required this.name,
    required this.serialNumber,
    required this.retailerId,
    required this.companyId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      serialNumber: json["serial_number"],
      retailerId: json["retailer_id"],
      companyId: json["company_id"],
    );
  }
}
