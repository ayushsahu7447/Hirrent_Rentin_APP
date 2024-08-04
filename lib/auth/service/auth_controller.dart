// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import 'auth_service.dart';
//
// final authControllerProvider = Provider((ref) {
//   final authRepository = ref.watch(authRepositoryProvider);
//   WidgetRef? refw;
//   return AuthController(authRepository: authRepository, ref: ref, refw: refw!);
// });
//
// class AuthController {
//   final AuthService authRepository;
//   final ProviderRef ref;
//   final WidgetRef refw;
//
//   AuthController(
//     {
//     required this.authRepository,
//     required this.ref,
//     required this.refw,
//   });
//
//   void signInWithPhone(BuildContext context, String phoneNumber) {
//     authRepository.signInWithPhone(
//         context: context, phoneNumber: phoneNumber, ref: refw);
//   }
//
//   void verifyOTP(BuildContext context, String verificationId, String userOTP) {
//     authRepository.verifyOTP(
//       context: context,
//       verificationId: verificationId,
//       userOTP: userOTP,
//     );
//   }
// }
