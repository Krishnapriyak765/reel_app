// // blocs/registration_bloc.dart

// import 'package:winngoo_reels_app/presentation/pages/auth/register/bloc/registrationevent.dart';

// class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
//   RegistrationBloc() : super(RegistrationState()) {
//     on<UpdatePageOne>((event, emit) {
//       emit(state.copyWith(
//         fname: event.fname,
//         lname: event.lname,
//         email: event.email,
//         phone: event.phone,
//       ));
//     });

//     on<UpdatePageTwo>((event, emit) {
//       emit(state.copyWith(
//         age: event.age,
//         profession: event.profession,
//         residentialCity: event.residentialCity,
//         residentialCountry: event.residentialCountry,
//       ));
//     });

//     on<UpdatePageThree>((event, emit) {
//       emit(state.copyWith(
//         password: event.password,
//         referralCode: event.referralCode,
//         stripeToken: event.stripeToken,
//         totalAmount: event.totalAmount,
//       ));
//     });

//     on<SubmitRegistration>((event, emit) async {
//       emit(state.copyWith(isSubmitting: true, error: '', isSuccess: false));
//       try {
//         final response = await ApiService.registerUser(
//           fname: state.fname,
//           lname: state.lname,
//           email: state.email,
//           phone: state.phone,
//           age: state.age,
//           profession: state.profession,
//           residentialCity: state.residentialCity,
//           residentialCountry: state.residentialCountry,
//           password: state.password,
//           referralCode: state.referralCode,
//           stripeToken: state.stripeToken,
//           totalAmount: state.totalAmount,
//           bearerToken: event.bearerToken,
//         );

//         if (response.statusCode == 200) {
//           emit(state.copyWith(isSuccess: true, isSubmitting: false));
//         } else {
//           emit(state.copyWith(isSubmitting: false, error: response.body));
//         }
//       } catch (e) {
//         emit(state.copyWith(isSubmitting: false, error: e.toString()));
//       }
//     });
//   }
// }
