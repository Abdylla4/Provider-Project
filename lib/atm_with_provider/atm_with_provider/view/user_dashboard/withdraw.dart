import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/providers/auth_provider.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/custom_button.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Withdraw extends StatelessWidget {
  final TextEditingController _amountController = TextEditingController();
  Withdraw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Withdraw'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppTexField(controller: _amountController, hintText: 'Amount TMT'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                return CustomButton(
                    color: Colors.amber,
                    title: 'Amount',
                    onPressed: () {
                      try {
                        authProvider.withdraw(
                            double.tryParse(_amountController.text) ?? 0);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Remove success'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.pop(context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(e.toString()),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
