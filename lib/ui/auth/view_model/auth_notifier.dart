import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthNotifier extends ValueNotifier<Stream<User?>> {
  AuthNotifier(super.value);
}