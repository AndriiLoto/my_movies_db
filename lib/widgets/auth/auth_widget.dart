import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          title: const Text('The Movie DB'),
          centerTitle: true,
          actions: const [
            Icon(Icons.person_2),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.search,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: ListView(
          children: const [_FirstHalf()],
        ));
  }
}

class _FirstHalf extends StatelessWidget {
  const _FirstHalf({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _FormWidget(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Log in to your account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. Click here to get started.',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          TextButton(
            onPressed: () => {},
            child: const Text(
              'Register',
              style: TextStyle(fontSize: 17),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'If you signed up but didn\'t get your verification email, Click here to have it resent.',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          TextButton(
            onPressed: () => {},
            child: const Text(
              'Verify',
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _usernameController = TextEditingController(text: 'admin');
  final _passwordController = TextEditingController(text: 'admin');
  String? errorText = null;
  void _auth() {
    if (_usernameController.text == 'admin' &&
        _passwordController.text == 'admin') {
      errorText = null;
      Navigator.of(context).pushReplacementNamed('home_screen');
    } else {
      errorText = 'Wrong username or password';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  final textFieldDecorator = const InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.lightBlue,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(0),
      ),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    isCollapsed: true,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              errorText != null
                  ? Column(
                      children: [
                        Text(
                          errorText!,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 17),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )
                  : const SizedBox(),
              const Text(
                'Username',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _usernameController,
                decoration: textFieldDecorator,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Password',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: textFieldDecorator,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.lightBlue),
                      textStyle: MaterialStatePropertyAll(
                        TextStyle(fontSize: 16),
                      ),
                    ),
                    onPressed: _auth,
                    child: const Text('Log in'),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                    onPressed: _resetPassword,
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
