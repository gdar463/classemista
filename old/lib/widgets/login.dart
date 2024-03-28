//
// login.dart
//
// Copyright (C) 2024 gdar463 <gdar463@gmail.com>
//
// This program is free software: you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation, version 3.
//
// This program is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
// PURPOSE. See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General
// Public License along with this program. If not, see
// <https://www.gnu.org/licenses/>.
//

import "package:classemista/cvv/features/auth.dart";
import "package:classemista/cvv/models/auth_response_model.dart";
import "package:classemista/cvv/models/profile_model.dart";
import "package:classemista/utils/display.dart";
import "package:classemista/widgets/main_page.dart";
import "package:flutter/material.dart";

/// The widget for the LoginPage
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  final String title = "Login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

/// A struct-like class for saving the inputs
class FormData {
  String? email;
  String? password;

  FormData({this.email, this.password});
}

/// The state for the LoginPage
class _LoginPageState extends State<LoginPage> {
  ProfileModel profile = ProfileModel.empty();
  FormData formData = FormData();

  bool loading = false;
  bool loggedIn = true;

  /// Activated on pressing the Sign In button
  void onPressed() async {
    loading = true;

    AuthResponseModel? auth;
    try {
      auth = await login(formData.email, formData.password);
    } catch (e) {
      loading = false;
      if (context.mounted) {
        // ignore: use_build_context_synchronously
        Display.showDialog("Errore", e.toString(), context);
      }
      return;
    }

    profile = ProfileModel.fromAuth(auth);

    loading = false;
    loggedIn = true;

    if (!context.mounted) return;

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => MainPage(profile: profile)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              child: Scrollbar(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ...[
                        TextFormField(
                          autofocus: true,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                              filled: true,
                              hintText: "Username or Email",
                              labelText: "Username"),
                          onChanged: (value) {
                            formData.email = value;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              filled: true, labelText: "Password"),
                          obscureText: true,
                          onChanged: (value) {
                            formData.password = value;
                          },
                        ),
                        FilledButton(
                          child: Builder(
                            builder: (context) {
                              if (loading) {
                                return const CircularProgressIndicator();
                              }

                              return const Text("Sign In");
                            },
                          ),
                          onPressed: () async {
                            onPressed();
                          },
                        )
                      ].expand(
                        (widget) => [
                          widget,
                          const SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
