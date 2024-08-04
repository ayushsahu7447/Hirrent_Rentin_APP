// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:hirrent/Model/user_model.dart';
// import 'package:hirrent/auth/screen/otp_screen.dart';
// import 'package:hirrent/constant/error_handling.dart';
// import 'package:hirrent/constant/utils.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:hirrent/global.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// final authRepositoryProvider = Provider(
//   (ref) => AuthService(
//     auth: FirebaseAuth.instance,
//   ),
// );
//
// final mobileProvider = StateProvider((ref) => '');
//
// class AuthService {
//   final FirebaseAuth auth;
//   AuthService({
//     required this.auth,
//   });
//
//   void signInWithPhone({
//     required BuildContext context,
//     required String phoneNumber,
//     required WidgetRef ref,
//   }) async {
//     FirebaseAuth auth = FirebaseAuth.instance;
//     try {
//       await auth.verifyPhoneNumber(
//         phoneNumber: phoneNumber,
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           ref.read(mobileProvider.notifier).update(
//                 (state) => phoneNumber,
//               );
//         },
//         verificationFailed: (e) {
//           throw Exception(e.message);
//         },
//         codeSent: ((String verificationId, int? resendToken) async {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => OTPScreen(
//                         verificationId: verificationId,
//                       )));
//         }),
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!);
//     }
//   }
//
//   void verifyOTP({
//     required BuildContext context,
//     required String verificationId,
//     required String userOTP,
//   }) async {
//     try {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId,
//         smsCode: userOTP,
//       );
//       await auth.signInWithCredential(credential);
//     } on FirebaseAuthException catch (e) {
//       showSnackBar(context, e.message!);
//     }
//   }
//
//   void registerUser({
//     required BuildContext context,
//     required String firstName,
//     required String lastName,
//     required String email,
//     required WidgetRef ref,
//   }) async {
//     var mobileNo = ref.read(mobileProvider);
//     try {
//       UserModel user = UserModel(
//         id: '',
//         first_name: firstName,
//         last_name: lastName,
//         email: email,
//         number: mobileNo,
//         password: '',
//         role: 'User',
//         token: '',
//         cart: [],
//         is_Deleted: false,
//       );
//
//       http.Response res = await http.post(
//         Uri.parse('$url/api/v1/mobileRegister'),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: user.toJson(),
//       );
//       if (context.mounted) {
//         httpErrorHandling(
//           response: res,
//           context: context,
//           onSuccess: () async {
//             SharedPreferences pref = await SharedPreferences.getInstance();
//             await pref.setString(key, value)
//           },
//         );
//       }
//     } catch (e) {
//       showSnackBar(
//         context,
//         e.toString(),
//       );
//     }
//   }
// }
