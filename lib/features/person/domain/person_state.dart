part of 'person_bloc.dart';

class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object?> get props => [];
}

class LoadingInitState extends PersonState {}

class LoadedListState extends PersonState {
  final List<Person> persons;
  final bool hasReachedMax;
  final bool isFooterLoading;
  final int currentPageNo;
  final Person personDetails;

  const LoadedListState(
      {required this.persons,
      required this.hasReachedMax,
      this.isFooterLoading = false,
      required this.currentPageNo,
      this.personDetails = const Person()});

  LoadedListState copyWith(
      {List<Person>? persons,
      bool? hasReachedMax,
      bool? isFooterLoading,
      int? currentPageNo,
      Person? personDetails}) {
    return LoadedListState(
        persons: persons ?? this.persons,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        isFooterLoading: isFooterLoading ?? this.isFooterLoading,
        currentPageNo: currentPageNo ?? this.currentPageNo,
        personDetails: personDetails ?? this.personDetails);
  }

  @override
  List<Object?> get props =>
      [persons, hasReachedMax, isFooterLoading, currentPageNo, personDetails];
}

class PersonDetailState extends PersonState {
  final Person person;

  const PersonDetailState(this.person);

  @override
  List<Object?> get props => [person];
}

class PersonErrorState extends PersonState {
  final String error;

  const PersonErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
