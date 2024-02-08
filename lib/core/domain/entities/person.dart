import 'address.dart';

class Person {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phone;
  final String? birthday;
  final String? gender;
  final Address? address;
  final String? website;
  final String? image;

  const Person(
      {this.id,
      this.firstname,
      this.lastname,
      this.email,
      this.phone,
      this.birthday,
      this.gender,
      this.address,
      this.website,
      this.image});

  factory Person.fromJson(json) {
    return Person(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        phone: json['phone'],
        birthday: json['birthday'],
        gender: json['gender'],
        address: Address.fromJson(json['address']),
        website: json['website'],
        image: json['image']);
  }
}
