import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthNotifier extends ValueNotifier<User?> {
  late StreamSubscription _subscription;
  AuthNotifier() : super(null) {
    _subscription = FirebaseAuth.instance.authStateChanges().listen((user) {
      value = user;
    });
  }

  @override
  void dispose() {
    //cancelando para evitar vazamentos de memoria 
    _subscription.cancel();
    super.dispose();
  }
}