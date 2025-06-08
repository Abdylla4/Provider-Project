import 'package:atm_provider/atm_with_provider/atm_with_provider/view/user_dashboard/atm.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/providers/auth_provider.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/custom_button.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UserAuth extends StatelessWidget {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UserAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('user login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTexField(controller: userController, hintText: 'user name'),
          const SizedBox(
            height: 10,
          ),
          AppTexField(controller: passwordController, hintText: 'password'),
          const SizedBox(
            height: 10,
          ),
          Consumer<AuthProvider>(
            builder: (context, authProvider, state) {
              if (authProvider.currentUser != null) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Atm(),
                      ),
                    );
                  },
                );
              }

              return CustomButton(
                color: Colors.orange,
                title: 'GO',
                onPressed: () {
                  try {
                    context.read<AuthProvider>().userLogin(
                        userController.text, passwordController.text);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          e.toString(),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
