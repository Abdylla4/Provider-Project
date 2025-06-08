import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Seebalance extends StatelessWidget {
  const Seebalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money'),
      ),
      body: Center(
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, chid) {
            return Text('Balance ${authProvider.currentUser?.balance} TMT');
          },
        ),
      ),
    );
  }
}
