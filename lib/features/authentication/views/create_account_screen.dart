import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateAccountScreen extends ConsumerWidget {
  static String routeName = "create-account";
  static String routeURL = "/create-account";
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Text(
                "Please enter your email and password to create an account.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    // formData['email'] = newValue;
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    // formData['password'] = newValue;
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  onPressed: () {
                    // ref.read(authenticationProvider.notifier).login();
                  },
                  child: const Text("Create Account"),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
