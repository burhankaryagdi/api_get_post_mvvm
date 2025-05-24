import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/sign_up_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Consumer<SignUpViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: viewModel.avatarController,
                decoration: InputDecoration(
                  enabled: false,
                  labelText: "Avatar",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: viewModel.nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.text_fields),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: viewModel.emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: viewModel.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: const Text("Sign Up"),
                onPressed: () {
                  viewModel.signUp(context);
                },
              ),
            ],
          );
        },
      ),
    );
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
}
