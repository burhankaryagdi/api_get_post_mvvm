import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required String token});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          final users = viewModel.users;
          if (users.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index].name!),
                subtitle: Text(users[index].email!),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index].avatar!),
                ),
              );
            },
          );
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      title: Text(
        "Users",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
