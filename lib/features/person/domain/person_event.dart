part of 'person_bloc.dart';

@immutable
abstract class PersonEvent extends Equatable {
}

class FetchPersonList extends PersonEvent {
  final int pageNo;

  FetchPersonList(this.pageNo);

  @override
  List<Object?> get props => [pageNo];
}

class GetPaginatedList extends PersonEvent {
  @override
  List<Object?> get props => [];
}

class GetDetail extends PersonEvent {
  final int id;

  GetDetail(this.id);

  @override
  List<Object?> get props => [id];
}
