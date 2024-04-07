class Company {
  int id;
  String name;
  int status;
  String statusReason;
  String evidenceLink;
  String image;
  String about;
  String moreInfo;

  Company({
    required this.id,
    required this.name,
    required this.status,
    required this.statusReason,
    required this.evidenceLink,
    required this.image,
    required this.about,
    required this.moreInfo,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      statusReason: json["status_reason"],
      evidenceLink: json["evidence_link"],
      image: json["image"],
      about: json["about"],
      moreInfo: json["more_info"],
    );
  }
}
