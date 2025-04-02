import 'package:api_get_post_mvvm/model/home_model.dart';
import 'package:api_get_post_mvvm/view_model/home_view_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required String token});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();
  List<HomeModel> users = [];

  @override
  void initState() {
    super.initState();
    _homeViewModel.fetchUser().then((value) {
      if (value != null) {
        setState(() {
          users = value;
        });
      } else {
        print("Error: No data found");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
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

  _buildBody() {
    return ListView.builder(
      itemCount: 7,
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
  }
}
