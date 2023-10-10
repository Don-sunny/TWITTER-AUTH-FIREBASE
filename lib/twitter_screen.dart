import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';

class TwitterLoginScreen extends StatefulWidget {
  const TwitterLoginScreen({super.key});

  @override
  State<TwitterLoginScreen> createState() => _TwitterLoginScreenState();
}

class _TwitterLoginScreenState extends State<TwitterLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with Twitter'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            login();
          },
          child: const Text('Login'),
        ),
      ),
    );
  }

  void login() async {
    final twitterLogin = TwitterLogin(
        apiKey: '9CegtFE1EwsAValiH1CLoCBkK',
        apiSecretKey: 'rRmpfkUYtP98BAbF6qWOoacdDXn8sBm9kNTwCohjIF5kOPofZJ',
        redirectURI: 'flutter-twitter-login://');

    await twitterLogin.login().then((value) async {
      final twitterAuthCredentials = TwitterAuthProvider.credential(
        accessToken: value.authToken!,
        secret: value.authTokenSecret!,
      );
      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredentials);
    });
  }
}
