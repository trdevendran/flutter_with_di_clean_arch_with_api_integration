class Address {
  final int? id;
  final String? street;
  final String? streetName;
  final String? buildingNumber;
  final String? city;
  final String? zipcode;
  final String? country;
  final String? countyCode;
  final double? latitude;
  final double? longitude;

  Address(
      {this.id,
      this.street,
      this.streetName,
      this.buildingNumber,
      this.city,
      this.zipcode,
      this.country,
      this.countyCode,
      this.latitude,
      this.longitude});

  factory Address.fromJson(json) {
    return Address(
        id: json['id'],
        street: json['street'],
        streetName: json['streetName'],
        buildingNumber: json['buildingNumber'],
        city: json['city'],
        zipcode: json['zipcode'],
        country: json['country'],
        countyCode: json['countyCode'],
        latitude: json['latitude'],
        longitude: json['longitude']);
  }

  @override
  String toString() {
    return "#$buildingNumber, $street,\n$streetName, $city,\n$country - $zipcode";
  }
}
