abstract class CosmicVelocityState {}

class InputState extends CosmicVelocityState {}

class LoadingState extends CosmicVelocityState {}

class ResultState extends CosmicVelocityState {
  final double velocity;
  final double mass;
  final double radius;

  ResultState(this.velocity, this.mass, this.radius);
}

class ErrorState extends CosmicVelocityState {
  final String message;

  ErrorState(this.message);
}