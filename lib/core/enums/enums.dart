enum RequestState { initial, loading, error, loaded }

extension RequestStateExtension on RequestState {
  bool isInitial() => this == RequestState.initial;
  bool isLoading() => this == RequestState.loading;
  bool isLoaded() => this == RequestState.loaded;
  bool hasError() => this == RequestState.error;
}
