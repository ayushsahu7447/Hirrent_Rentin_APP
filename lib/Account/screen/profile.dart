import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hirrent/ewidget/button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  String name;
  String email;
  String phone;
  String profilePic;
  String password;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.profilePic,
    required this.password,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String _profilePic = '';
  bool _isImageLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(221,213,224,2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_outlined , size: 20,color: Colors.black,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/Icon.svg",color: Colors.black , height: 22,width: 22,
            ),
          )
        ],
        title: Row(
          children: [
            Text("Update Profile", style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5,),
          Container(
          height: size.height/4,
            width: size.width/1.05,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: _isImageLoading
                              ? AssetImage('assets/images/loading.gif')
                              : _profilePic.isEmpty
                              ? AssetImage('assets/images/avatar.png')
                              : NetworkImage(_profilePic) as ImageProvider,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: _deleteProfilePic,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.deepPurple,
                            ),
                            padding: EdgeInsets.all(5),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: _pickImage,
                      child: Text(
                        'Edit',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
              SizedBox(height: 7,),
              Container(
            height: size.height/1.8,
            width: size.width/1.05,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            padding: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 13,color: Colors.black54 , ),
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 13,color: Colors.black54 , ),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Phone',
                    style: TextStyle(fontSize: 13,color: Colors.black54 , ),
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: 'Enter your phone',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Password',
                    style: TextStyle(fontSize: 13,color: Colors.black54 , ),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                    ),
                  ),
                  SizedBox(height: 20),
                  submit(label: "Update", width: size.width/20, onCountSelected: _updateUserData)],
              ),
            ),
          ),
              SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';
    final email = prefs.getString('email') ?? '';
    final phone = prefs.getString('phone') ?? '';
    final profilePic = prefs.getString('profilePic') ?? '';
    final password = prefs.getString('password') ?? '';

    setState(() {
      _nameController.text = name;
      _emailController.text = email;
      _phoneController.text = phone;
      _profilePic = profilePic;
      _passwordController.text = password;
    });
  }

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _isImageLoading = true;
      });
      final file = File(pickedFile.path);
// Upload the file to a cloud storage service and get the URL.
// For example, you can use Firebase Storage.
      final url = 'https://example.com/image.jpg';
      setState(() {
        _profilePic = url;
        _isImageLoading = false;
      });
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profilePic', url);
    }
  }

  void _deleteProfilePic() async {
    setState(() {
      _profilePic = '';
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('profilePic');
  }

  void _updateUserData() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final password = _passwordController.text;

// Update the user model with the new data.
    final user = User(
      name: name,
      email: email,
      phone: phone,
      profilePic: _profilePic,
      password: password,
    );

// Save the user data to the shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('email', email);
    await prefs.setString('phone', phone);
    await prefs.setString('password', password);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Your profile has been updated successfully.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        }); // Clear the password field.
    _passwordController.clear();
  }
}

// class User {
//   final String name;
//   final String email;
//   final String phone;
//   final String profilePic;
//   final String password;
//
//   User({
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.profilePic,
//     required this.password,
//   });
// }

class _ProfilePic extends StatelessWidget {
  final String? imageUrl;
  final bool isImageLoading;
  final VoidCallback onPickImage;
  final VoidCallback onDeleteProfilePic;

  const _ProfilePic({
    Key? key,
    required this.imageUrl,
    required this.isImageLoading,
    required this.onPickImage,
    required this.onDeleteProfilePic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = 120.0;
    final borderRadius = BorderRadius.circular(size / 2);
    return Stack(
      children: [
        if (imageUrl != null && imageUrl!.isNotEmpty)
          Positioned.fill(
            child: ClipRRect(
              borderRadius: borderRadius,
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
        if ((imageUrl == null || imageUrl!.isEmpty) && !isImageLoading)
          Positioned.fill(
            child: Icon(
              Icons.person,
              size: size,
              color: Colors.grey[400],
            ),
          ),
        if (isImageLoading)
          Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        Positioned(
          bottom: 0,
          right: 0,
          child: FloatingActionButton(
            onPressed: onPickImage,
            tooltip: 'Pick Image',
            child: Icon(Icons.photo_camera),
          ),
        ),
        if (imageUrl != null && imageUrl!.isNotEmpty)
          Positioned(
            bottom: 0,
            right: 0,
            child: FloatingActionButton(
              onPressed: onDeleteProfilePic,
              tooltip: 'Delete Profile Pic',
              child: Icon(Icons.delete),
            ),
          ),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isObscureText;
  final String? Function(String?)? validator;

  const _InputField({
    Key? key,
    required this.label,
    required this.controller,
    this.isObscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      controller: controller,
      obscureText: isObscureText,
      validator: validator,
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _SubmitButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _LogoutButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text('Logout'),
    );
  }
}
