import 'package:flutter/material.dart';

import '../view_model/sign_up_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  SignUpViewModel signUpViewModel = SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "Sign Up",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: signUpViewModel.avatarController,
          decoration: InputDecoration(
            enabled: false,
            labelText: "Avatar",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: const Icon(Icons.person),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: signUpViewModel.nameController,
          decoration: InputDecoration(
            labelText: "Name",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: const Icon(Icons.text_fields),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: signUpViewModel.emailController,
          decoration: InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: const Icon(Icons.email),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: signUpViewModel.passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: "Password",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: const Icon(Icons.lock),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          child: const Text("Sign Up"),
          onPressed: () async {
            final result = await signUpViewModel.signUp();

            if (!mounted) return;

            if (result != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Kayıt başarılı: ${result.email}")),
              );
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Kayıt başarısız")));
            }
          },
        ),
      ],
    );
  }
}
