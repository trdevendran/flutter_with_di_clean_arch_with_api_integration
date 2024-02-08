import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/../core/constants/api_keys.dart';
import '/../core/constants/constants.dart';
import '/../core/domain/entities/person.dart';
import '/../core/domain/usecases/person_use_cases.dart';

part 'person_event.dart';

part 'person_state.dart';

/// Register all the events of the Person module with the respective emitter to deliver state to the UI layer
/// Widget based business logics represents here
class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonUseCases personUseCases;

  PersonBloc(this.personUseCases) : super(LoadingInitState()) {
    on<FetchPersonList>(_onFetchPersonList);
    on<GetDetail>(_onGetDetail);
  }

  Future<FutureOr<void>> _onFetchPersonList(
      FetchPersonList event, Emitter<PersonState> emit) async {
    LoadedListState? oldState;
    int quantity = ApiKeys.paramFirstPageCount;
    if (event.pageNo == 1) {
      emit(LoadingInitState());
    } else if (state is LoadedListState) {
      oldState = state as LoadedListState;
      emit(oldState.copyWith(isFooterLoading: true));
      quantity = ApiKeys.paramPerPageCount;
    }
    try {
      // Not setting parameter to get next page/set data as everytime
      // the response data randomly provided by the server
      final persons = await personUseCases.getPersonList(quantity);
      if (oldState != null) {
        oldState.persons.addAll(persons);
        emit(oldState.copyWith(
            persons: oldState.persons,
            currentPageNo: event.pageNo,
            hasReachedMax: event.pageNo == Constants.maximumPaginationCount));
      } else {
        emit(LoadedListState(
            persons: persons,
            hasReachedMax: false,
            currentPageNo: event.pageNo));
      }
    } catch (e) {
      emit(PersonErrorState(e.toString()));
    }
  }

  /// This method may use in future when get ID via deeplink to get the full details
  FutureOr<void> _onGetDetail(GetDetail event, Emitter<PersonState> emit) {}
}
