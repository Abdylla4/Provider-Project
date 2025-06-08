import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: Consumer<AuthProvider>(builder: (context, authProvder, state) {
        return ListView.builder(
            itemCount: authProvder.users.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 1,
                child: ListTile(
                  title: Text(authProvder.users[index].username),
                  subtitle: Text(authProvder.users[index].password),
                  trailing: Text(authProvder.users[index].balance.toString()),
                ),
              );
            });
      }),
    );
  }
}
