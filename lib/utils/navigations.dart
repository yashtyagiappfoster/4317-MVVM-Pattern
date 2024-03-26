import 'package:flutter/material.dart';
import 'package:mvvm_one/Users_list/views/add_user_screen.dart';
import 'package:mvvm_one/Users_list/views/user_detail_screen.dart';

void openUserDetailsScrren(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserDetailScreen(),
    ),
  );
}

void openAddUserScreen(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => AddUserScreen(),
    ),
  );
}
