import 'package:atm_provider/atm_with_provider/atm_with_provider/view/admin/admin_login_page.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view/user/user_auth.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                color: Colors.green,
                title: 'admin',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminLoginPage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                color: Colors.blue,
                title: 'User',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserAuth(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
