// events/registration_event.dart
abstract class RegistrationEvent {}

class UpdatePageOne extends RegistrationEvent {
  final String fname;
  final String lname;
  final String email;
  final String phone;

  UpdatePageOne(this.fname, this.lname, this.email, this.phone);
}

class UpdatePageTwo extends RegistrationEvent {
  final int age;
  final String profession;
  final String residentialCity;
  final String residentialCountry;

  UpdatePageTwo(
    this.age,
    this.profession,
    this.residentialCity,
    this.residentialCountry,
  );
}

class UpdatePageThree extends RegistrationEvent {
  final String password;
  final String referralCode;
  final String stripeToken;
  final double totalAmount;

  UpdatePageThree(
    this.password,
    this.referralCode,
    this.stripeToken,
    this.totalAmount,
  );
}

class SubmitRegistration extends RegistrationEvent {
  final String bearerToken;

  SubmitRegistration(this.bearerToken);
}
