import 'package:flutter/material.dart';
import 'package:my_classeviva/cvv/auth.dart';
import 'package:my_classeviva/cvv/exceptions/http_request_exception.dart';
import 'package:my_classeviva/cvv/exceptions/wrong_credentials_exception.dart';
import 'package:my_classeviva/cvv/models/auth_response_model.dart';
import 'package:my_classeviva/cvv/models/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title = "THE MAGICAL WORLD OF ZAMPA";

  @override
  State<HomePage> createState() => _HomePageState();
}

class FormData {
  String? email;
  String? password;

  FormData({this.email, this.password});
}

class _HomePageState extends State<HomePage> {
  Profile? profile;
  FormData formData = FormData();

  bool loading = false;

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

    print(auth);

    var firstName = profile?.firstName;
    firstName ??= "null";

    var lastName = profile?.lastName;
    lastName ??= "null";

    var ident = profile?.ident;
    ident ??= "ident";

    loading = false;
    _showDialog(
        "Logged In!\nNome: $firstName\nCognome: $lastName\nident: $ident");
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
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
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
