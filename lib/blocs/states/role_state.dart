abstract class RoleState {}

class RoleInitial extends RoleState {}

class RoleLoading extends RoleState {}

class RoleLoaded extends RoleState {
  final String role;
  RoleLoaded(this.role);

  @override
  List<Object?> get props => [role];
}

class RoleError extends RoleState {
  final String message;
  RoleError(this.message);

  @override
  List<Object?> get props => [message];
}
