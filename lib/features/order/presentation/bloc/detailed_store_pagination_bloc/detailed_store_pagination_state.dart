part of 'detailed_store_pagination_bloc.dart';

@immutable
sealed class DetailedStorePaginationState extends Equatable{
  const DetailedStorePaginationState() ;

  @override
  List<Object?> get props => [];
}

final class DetailedStorePaginationInitial extends DetailedStorePaginationState {}


final class LoadingStoreState extends DetailedStorePaginationState {}

class FailedStoreState extends DetailedStorePaginationState {
  final AppFailure failure;

  const FailedStoreState({required this.failure});

  @override
  List<Object> get props => [failure];
}

class LoadedDetailedStoreState extends DetailedStorePaginationState {
  final DetailedStoreEntity detailedStore;

  const LoadedDetailedStoreState({required this.detailedStore});

  @override
  List<Object> get props => [detailedStore];
}
