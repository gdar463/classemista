import "package:flutter/material.dart";
import "package:classemista/cvv/auth.dart";
import "package:classemista/cvv/exceptions/http_request_exception.dart";
import "package:classemista/cvv/exceptions/wrong_credentials_exception.dart";
import "package:classemista/cvv/models/auth_response_model.dart";
import "package:classemista/cvv/models/profile.dart";
import "package:classemista/widgets/main_page.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  final String title = "THE MAGICAL WORLD OF ZAMPA";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class FormData {
  String? email;
  String? password;

  FormData({this.email, this.password});
}

class _LoginPageState extends State<LoginPage> {
  Profile? profile;
  FormData formData = FormData();

  bool loading = false;
  bool loggedIn = true;

  void onPressed() async {
    loading = true;

    AuthResponseModel? auth;
    try {
      auth = await login(formData.email, formData.password);
    } on WrongCredentialsExcpetion catch (e) {
      loading = false;
      _showDialog(e.toString());
      return;
    } on HttpRequestException catch (e) {
      loading = false;
      _showDialog(e.toString());
      return;
    }

    profile = Profile.fromAuth(auth);

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
                        child: Column(children: [
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
                        ]))))
          ],
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
