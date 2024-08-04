// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// final userProvider = StateNotifierProvider<UserNotifier, UserModel.User>(
//       (ref) => UserNotifier(),
// );
// final authLoading = StateProvider<bool>((ref) => false);

// class AuthService {
//   void signWithGoogle(
//       BuildContext context,
//       WidgetRef? ref,
//       ) async {
//     try {
//       final GoogleSignIn googleSignIn = GoogleSignIn();

//       final GoogleSignInAccount? googleSignInAccount =
//       await googleSignIn.signIn();

//       UserModel.User user = UserModel.User(
//         id: '',
//         uniqueId: '',
//         displayName: googleSignInAccount!.displayName!.toString(),
//         email: googleSignInAccount.email,
//         mobile: 0,
//         profilePicture:
//         'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
//         followers: [],
//         following: [],
//         token: '',
//         createdAt: '',
//       );

//       http.Response res = await http.post(
//         Uri.parse('$url/api/signup'),
//         body: user.toJson(),
//         headers: <String, String>{
//           "Content-Type": "application/json; charset=UTF-8",
//         },
//       );

//       if (context.mounted) {
//         httpErrorHanding(
//           res: res,
//           context: context,
//           onSuccess: () async {
//             SharedPreferences prefs = await SharedPreferences.getInstance();
//             await prefs.setString(
//                 'x-access-token', jsonDecode(res.body)['token']);
//             ref!.read(userProvider.notifier).updateUser(res.body);
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => BottomBar(data: 0),
//               ),
//             );
//           },
//         );
//       }
//     } catch (e) {
//       showSnackbar(context, e.toString());
//     }
//   }

//   void signWithGitHub({
//     required BuildContext context,
//   }) async {
//     try {
//       const String url =
//           "https://github.com/login/oauth/authorize?client_id=$clientID&scope=user:email";

//       if (await canLaunchUrlString(url)) {
//         await launchUrlString(url);
//       } else {
//         throw "Could not launch $url";
//       }
//     } catch (e) {
//       showSnackbar(context, e.toString());
//     }
//   }

//   Future<void> getUserData(
//       BuildContext context,
//       WidgetRef ref,
//       ) async {
//     try {
//       var userData = ref.read(userProvider);
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('x-access-token');

//       ref.read(authLoading.notifier).update((state) => true);
//       if (token == null) {
//         prefs.setString('x-access-token', '');
//       }

//       var tokenRes = await http.post(
//         Uri.parse('$url/tokenIsValid'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'x-access-token': token!
//         },
//       );

//       var response = jsonDecode(tokenRes.body);

//       if (response == true) {
//         http.Response userRes = await http.get(
//           Uri.parse('$url/'),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//             'x-access-token': token
//           },
//         );
//         ref.read(userProvider.notifier).updateUser(userRes.body);

//         ref.read(authLoading.notifier).update((state) => false);
//       }
//     } catch (e) {
//       showSnackbar(context, e.toString());
//     }
//   }
// }