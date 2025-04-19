// states/registration_state.dart
class RegistrationState {
  final String fname;
  final String lname;
  final String email;
  final String phone;
  final int age;
  final String profession;
  final String residentialCity;
  final String residentialCountry;
  final String password;
  final String referralCode;
  final String stripeToken;
  final double totalAmount;
  final bool isSubmitting;
  final bool isSuccess;
  final String error;

  RegistrationState({
    this.fname = '',
    this.lname = '',
    this.email = '',
    this.phone = '',
    this.age = 0,
    this.profession = '',
    this.residentialCity = '',
    this.residentialCountry = '',
    this.password = '',
    this.referralCode = '',
    this.stripeToken = '',
    this.totalAmount = 0.0,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error = '',
  });

  RegistrationState copyWith({
    String? fname,
    String? lname,
    String? email,
    String? phone,
    int? age,
    String? profession,
    String? residentialCity,
    String? residentialCountry,
    String? password,
    String? referralCode,
    String? stripeToken,
    double? totalAmount,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
  }) {
    return RegistrationState(
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      age: age ?? this.age,
      profession: profession ?? this.profession,
      residentialCity: residentialCity ?? this.residentialCity,
      residentialCountry: residentialCountry ?? this.residentialCountry,
      password: password ?? this.password,
      referralCode: referralCode ?? this.referralCode,
      stripeToken: stripeToken ?? this.stripeToken,
      totalAmount: totalAmount ?? this.totalAmount,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
    );
  }
}
