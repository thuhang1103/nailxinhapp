abstract class ProfileEvent {}

class GetProfile extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {}

class DeleteAccount extends ProfileEvent {}

class NameChanged extends ProfileEvent {
  final String name;
  NameChanged(this.name);
}

class PhoneChanged extends ProfileEvent {
  final String phone;
  PhoneChanged(this.phone);
}
