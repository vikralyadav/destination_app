abstract class DestinationState {}
class DestinationLoading extends DestinationState {}
class DestinationLoaded extends DestinationState {
  final List destinations;
  DestinationLoaded(this.destinations);
}
class DestinationError extends DestinationState {}