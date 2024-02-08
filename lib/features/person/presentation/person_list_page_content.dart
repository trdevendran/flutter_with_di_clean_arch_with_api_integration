part of 'person_list_page.dart';

/// Displays main content/body of the [Person] list page
class PersonListPageContent extends StatelessWidget {
  /// It provides the state of the UI layer
  final PersonState state;

  /// It tracks the scroll and handles its properties.
  final ScrollController scrollController;

  /// This callback used when need to trigger server call to fetch data.
  /// Also it is available when list data is unable to fetch or interrupted.
  final Function() retryCallback;

  /// It allows the pagination to fetch more data until the last page.
  final Function() manualPaginationCallback;

  const PersonListPageContent(
      {super.key,
      required this.state,
      required this.scrollController,
      required this.retryCallback,
      required this.manualPaginationCallback});

  @override
  Widget build(BuildContext context) {
    if (state is LoadingInitState) {
      return const SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: LoaderWidget());
    } else if (state is LoadedListState) {
      var loadedState = state as LoadedListState;
      if (loadedState.persons.isEmpty) {
        return Center(
            child: reFetchWidget(
                Constants.titleRefresh, Constants.titleNoRecordFound));
      }
      return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (index < loadedState.persons.length) {
              /// Actual content of the person list loads here
              return PersonListTile(person: loadedState.persons[index]);
            } else if (loadedState.isFooterLoading) {
              return const Center(child: FooterLoadingWidget());
            } else if (!loadedState.hasReachedMax && kIsWeb) {
              return Center(
                  child: TextButton(
                onPressed: () => manualPaginationCallback(),
                child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(Constants.titleLoadMore)),
              ));
            } else {
              return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      Constants.titleLoadedEverything,
                      style: TextStyles.subtitleStyle,
                    ),
                  ));
            }
          },
          separatorBuilder: (context, index) =>
              const Divider(color: Colors.grey),
          controller: scrollController,
          itemCount: loadedState.persons.length +
              1 // Adding one more row to place footer actions
          );
    } else {
      return Center(
        child:
            reFetchWidget(Constants.titleRetry, Constants.titleUnableToFetch),
      );
    }
  }

  /// Handles failure or empty list cases for better usability
  Widget reFetchWidget(String buttonTitle, String message) {
    return RetryWidget(
        buttonTitle: buttonTitle,
        placeholderMessage: message,
        onPressed: () => retryCallback());
  }
}
