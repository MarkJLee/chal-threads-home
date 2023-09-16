import 'package:chal_threads_home/features/profile/view_models/dark_mode_mv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  static String routeName = "login";
  static String routeURL = "/login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider).isDarkMode;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("English (US)"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isDarkMode ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              child: SvgPicture.asset(
                'assets/threads.svg',
                height: 12,
                colorFilter: isDarkMode
                    ? const ColorFilter.mode(Colors.black, BlendMode.srcIn)
                    : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
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
                child: const Text("Login"),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text(
              "Forgot password?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.push("/create-account");
              },
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all()),
                child: const Center(
                  child: Text(
                    "Create new account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(FontAwesomeIcons.meta, size: 15),
                Text(
                  "Meta",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
