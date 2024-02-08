import '../../../core/domain/entities/person.dart';

class PersonListResponse {
  final String? status;
  final int? code;
  final int? total;
  final List<Person>? data;

  PersonListResponse({this.status, this.code, this.total, this.data});

  factory PersonListResponse.fromJson(json) {
    List<Person> list =
        json['data'].map<Person>((e) => Person.fromJson(e)).toList() ?? [];
    return PersonListResponse(
        status: json['status'],
        code: json['code'],
        total: json['total'],
        data: list);
  }
}
