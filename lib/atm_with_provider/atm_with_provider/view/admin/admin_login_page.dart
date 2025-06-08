import 'package:atm_provider/atm_with_provider/atm_with_provider/view/admin/add_user.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/custom_button.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  State<AdminLoginPage> createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AppTexField(
                controller: usernameController,
                hintText: 'Admin',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'bos goyma';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              AppTexField(
                  controller: passwordController, hintText: 'password'),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  color: Colors.orange,
                  title: 'GO',
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        usernameController.text == 'admin' &&
                        passwordController.text == '1234') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddUser(),
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
