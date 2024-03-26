import 'package:flutter/material.dart';
import 'package:mvvm_one/Users_list/view_models/user_view_model.dart';
import 'package:mvvm_one/utils/navigations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              openAddUserScreen(context);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              userProvider.getUsers();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [_ui(userProvider)],
        ),
      ),
    );
  }

  _ui(UserViewModel userProvider) {
    if (userProvider.loading) {
      return const Center(
        child: CircularProgressIndicator(color: Colors.black),
      );
    }
    if (userProvider.userError != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              userProvider.userError!.code.toString(),
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              userProvider.userError!.message.toString(),
              style: const TextStyle(fontSize: 30, color: Colors.black),
            ),
          ],
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: userProvider.usersList.length,
        itemBuilder: (context, index) {
          userProvider.getUsers;
          return ListTile(
            onTap: () {
              openUserDetailsScrren(context);
            },
            title: Text(userProvider.usersList[index].name.toString()),
            subtitle: Text(userProvider.usersList[index].email.toString()),
          );
        },
      ),
    );
  }
}
